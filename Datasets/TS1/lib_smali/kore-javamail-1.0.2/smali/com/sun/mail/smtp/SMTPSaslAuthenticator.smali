.class public Lcom/sun/mail/smtp/SMTPSaslAuthenticator;
.super Ljava/lang/Object;
.source "SMTPSaslAuthenticator.java"

# interfaces
.implements Lcom/sun/mail/smtp/SaslAuthenticator;


# instance fields
.field private host:Ljava/lang/String;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private name:Ljava/lang/String;

.field private pr:Lcom/sun/mail/smtp/SMTPTransport;

.field private props:Ljava/util/Properties;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 75
    :try_start_0
    invoke-static {}, Lcom/sun/mail/auth/OAuth2SaslClientFactory;->init()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_4

    .line 77
    :goto_3
    return-void

    .line 76
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;Ljava/util/Properties;Lcom/sun/mail/util/MailLogger;Ljava/lang/String;)V
    .registers 6
    .param p1, "pr"    # Lcom/sun/mail/smtp/SMTPTransport;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "props"    # Ljava/util/Properties;
    .param p4, "logger"    # Lcom/sun/mail/util/MailLogger;
    .param p5, "host"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    .line 82
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->name:Ljava/lang/String;

    .line 83
    iput-object p3, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->props:Ljava/util/Properties;

    .line 84
    iput-object p4, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    .line 85
    iput-object p5, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->host:Ljava/lang/String;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPSaslAuthenticator;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    return-object v0
.end method

.method private static final responseText(Lcom/sun/mail/smtp/SMTPTransport;)Ljava/lang/String;
    .registers 4
    .param p0, "pr"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    const/4 v2, 0x4

    .line 240
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getLastServerResponse()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "resp":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_14

    .line 242
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 244
    :goto_13
    return-object v1

    :cond_14
    const-string v1, ""

    goto :goto_13
.end method


# virtual methods
.method public authenticate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 27
    .param p1, "mechs"    # [Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "authzid"    # Ljava/lang/String;
    .param p4, "u"    # Ljava/lang/String;
    .param p5, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v11, 0x0

    .line 93
    .local v11, "done":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 94
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL Mechanisms:"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 95
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_17
    move-object/from16 v0, p1

    array-length v4, v0

    if-ge v13, v4, :cond_3b

    .line 96
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p1, v13

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 95
    add-int/lit8 v13, v13, 0x1

    goto :goto_17

    .line 97
    :cond_3b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 101
    .end local v13    # "i":I
    :cond_44
    new-instance v9, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p2

    invoke-direct {v9, v0, v1, v2, v3}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator$1;-><init>(Lcom/sun/mail/smtp/SMTPSaslAuthenticator;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .local v9, "cbh":Ljavax/security/auth/callback/CallbackHandler;
    :try_start_51
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->host:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->props:Ljava/util/Properties;

    move-object/from16 v4, p1

    move-object/from16 v5, p3

    invoke-static/range {v4 .. v9}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;
    :try_end_64
    .catch Ljavax/security/sasl/SaslException; {:try_start_51 .. :try_end_64} :catch_78

    move-result-object v19

    .line 145
    .local v19, "sc":Ljavax/security/sasl/SaslClient;
    if-nez v19, :cond_92

    .line 146
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "No SASL support"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 147
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    const-string v5, "No SASL support"

    invoke-direct {v4, v5}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 141
    .end local v19    # "sc":Ljavax/security/sasl/SaslClient;
    :catch_78
    move-exception v20

    .line 142
    .local v20, "sex":Ljavax/security/sasl/SaslException;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "Failed to create SASL client"

    move-object/from16 v0, v20

    invoke-virtual {v4, v5, v6, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 143
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    invoke-virtual/range {v20 .. v20}, Ljavax/security/sasl/SaslException;->getMessage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v20

    invoke-direct {v4, v5, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 149
    .end local v20    # "sex":Ljavax/security/sasl/SaslException;
    .restart local v19    # "sc":Ljavax/security/sasl/SaslClient;
    :cond_92
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_bc

    .line 150
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL client "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface/range {v19 .. v19}, Ljavax/security/sasl/SaslClient;->getMechanismName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 154
    :cond_bc
    :try_start_bc
    invoke-interface/range {v19 .. v19}, Ljavax/security/sasl/SaslClient;->getMechanismName()Ljava/lang/String;

    move-result-object v16

    .line 155
    .local v16, "mech":Ljava/lang/String;
    const/4 v15, 0x0

    .line 156
    .local v15, "ir":Ljava/lang/String;
    invoke-interface/range {v19 .. v19}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v4

    if-eqz v4, :cond_dd

    .line 157
    const/4 v4, 0x0

    new-array v4, v4, [B

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v10

    .line 158
    .local v10, "ba":[B
    array-length v4, v10

    if-lez v4, :cond_144

    .line 159
    invoke-static {v10}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v10

    .line 160
    const/4 v4, 0x0

    array-length v5, v10

    invoke-static {v10, v4, v5}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v15

    .line 164
    .end local v10    # "ba":[B
    :cond_dd
    :goto_dd
    if-eqz v15, :cond_147

    .line 165
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v18

    .line 173
    .local v18, "resp":I
    :goto_106
    const/16 v4, 0x212

    move/from16 v0, v18

    if-ne v0, v4, :cond_13c

    .line 174
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v4}, Lcom/sun/mail/smtp/SMTPTransport;->startTLS()V

    .line 175
    if-eqz v15, :cond_165

    .line 176
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v18

    .line 181
    :cond_13c
    :goto_13c
    const/16 v4, 0xeb

    move/from16 v0, v18

    if-ne v0, v4, :cond_183

    .line 182
    const/4 v4, 0x1

    .line 236
    .end local v15    # "ir":Ljava/lang/String;
    .end local v16    # "mech":Ljava/lang/String;
    .end local v18    # "resp":I
    :goto_143
    return v4

    .line 162
    .restart local v10    # "ba":[B
    .restart local v15    # "ir":Ljava/lang/String;
    .restart local v16    # "mech":Ljava/lang/String;
    :cond_144
    const-string v15, "="

    goto :goto_dd

    .line 167
    .end local v10    # "ba":[B
    :cond_147
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v18

    .restart local v18    # "resp":I
    goto :goto_106

    .line 178
    :cond_165
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "AUTH "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I
    :try_end_181
    .catch Ljava/lang/Exception; {:try_start_bc .. :try_end_181} :catch_18b

    move-result v18

    goto :goto_13c

    .line 184
    :cond_183
    const/16 v4, 0x14e

    move/from16 v0, v18

    if-eq v0, v4, :cond_199

    .line 185
    const/4 v4, 0x0

    goto :goto_143

    .line 186
    .end local v15    # "ir":Ljava/lang/String;
    .end local v16    # "mech":Ljava/lang/String;
    .end local v18    # "resp":I
    :catch_18b
    move-exception v12

    .line 187
    .local v12, "ex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "SASL AUTHENTICATE Exception"

    invoke-virtual {v4, v5, v6, v12}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    const/4 v4, 0x0

    goto :goto_143

    .line 191
    .end local v12    # "ex":Ljava/lang/Exception;
    .restart local v15    # "ir":Ljava/lang/String;
    .restart local v16    # "mech":Ljava/lang/String;
    .restart local v18    # "resp":I
    :cond_199
    :goto_199
    if-nez v11, :cond_25b

    .line 193
    const/16 v4, 0x14e

    move/from16 v0, v18

    if-ne v0, v4, :cond_249

    .line 194
    const/4 v10, 0x0

    .line 195
    .restart local v10    # "ba":[B
    :try_start_1a2
    invoke-interface/range {v19 .. v19}, Ljavax/security/sasl/SaslClient;->isComplete()Z

    move-result v4

    if-nez v4, :cond_1f3

    .line 196
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-static {v4}, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->responseText(Lcom/sun/mail/smtp/SMTPTransport;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    .line 197
    array-length v4, v10

    if-lez v4, :cond_1bb

    .line 198
    invoke-static {v10}, Lcom/sun/mail/util/BASE64DecoderStream;->decode([B)[B

    move-result-object v10

    .line 199
    :cond_1bb
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_1ed

    .line 200
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL challenge: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    array-length v7, v10

    .line 201
    invoke-static {v10, v6, v7}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 200
    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 202
    :cond_1ed
    move-object/from16 v0, v19

    invoke-interface {v0, v10}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v10

    .line 204
    :cond_1f3
    if-nez v10, :cond_209

    .line 205
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL: no response"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 206
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    const-string v5, "*"

    invoke-virtual {v4, v5}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand(Ljava/lang/String;)I

    move-result v18

    goto :goto_199

    .line 208
    :cond_209
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_23b

    .line 209
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    array-length v7, v10

    .line 210
    invoke-static {v10, v6, v7}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 209
    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 211
    :cond_23b
    invoke-static {v10}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v10

    .line 212
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->pr:Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v4, v10}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand([B)I
    :try_end_246
    .catch Ljava/lang/Exception; {:try_start_1a2 .. :try_end_246} :catch_24c

    move-result v18

    goto/16 :goto_199

    .line 215
    .end local v10    # "ba":[B
    :cond_249
    const/4 v11, 0x1

    goto/16 :goto_199

    .line 216
    .restart local v10    # "ba":[B
    :catch_24c
    move-exception v14

    .line 217
    .local v14, "ioex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "SASL Exception"

    invoke-virtual {v4, v5, v6, v14}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 218
    const/4 v11, 0x1

    .line 220
    goto/16 :goto_199

    .line 222
    .end local v10    # "ba":[B
    .end local v14    # "ioex":Ljava/lang/Exception;
    :cond_25b
    const/16 v4, 0xeb

    move/from16 v0, v18

    if-eq v0, v4, :cond_264

    .line 223
    const/4 v4, 0x0

    goto/16 :goto_143

    .line 225
    :cond_264
    invoke-interface/range {v19 .. v19}, Ljavax/security/sasl/SaslClient;->isComplete()Z

    move-result v4

    if-eqz v4, :cond_296

    .line 226
    const-string v4, "javax.security.sasl.qop"

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljavax/security/sasl/SaslClient;->getNegotiatedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 227
    .local v17, "qop":Ljava/lang/String;
    if-eqz v17, :cond_296

    const-string v4, "auth-int"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_28a

    const-string v4, "auth-conf"

    .line 228
    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_296

    .line 230
    :cond_28a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL Mechanism requires integrity or confidentiality"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 232
    const/4 v4, 0x0

    goto/16 :goto_143

    .line 236
    .end local v17    # "qop":Ljava/lang/String;
    :cond_296
    const/4 v4, 0x1

    goto/16 :goto_143
.end method
