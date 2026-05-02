.class public Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;
.super Ljava/lang/Object;
.source "IMAPSaslAuthenticator.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/SaslAuthenticator;


# instance fields
.field private host:Ljava/lang/String;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private name:Ljava/lang/String;

.field private pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

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

.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/util/Properties;Lcom/sun/mail/util/MailLogger;Ljava/lang/String;)V
    .registers 6
    .param p1, "pr"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "props"    # Ljava/util/Properties;
    .param p4, "logger"    # Lcom/sun/mail/util/MailLogger;
    .param p5, "host"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 82
    iput-object p2, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->name:Ljava/lang/String;

    .line 83
    iput-object p3, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->props:Ljava/util/Properties;

    .line 84
    iput-object p4, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    .line 85
    iput-object p5, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->host:Ljava/lang/String;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;)Lcom/sun/mail/util/MailLogger;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    return-object v0
.end method


# virtual methods
.method public authenticate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 35
    .param p1, "mechs"    # [Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "authzid"    # Ljava/lang/String;
    .param p4, "u"    # Ljava/lang/String;
    .param p5, "p"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v28, v0

    monitor-enter v28

    .line 93
    :try_start_7
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .local v27, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    const/16 v26, 0x0

    .line 95
    .local v26, "tag":Ljava/lang/String;
    const/16 v22, 0x0

    .line 96
    .local v22, "r":Lcom/sun/mail/iap/Response;
    const/4 v14, 0x0

    .line 97
    .local v14, "done":Z
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_57

    .line 98
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL Mechanisms:"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 99
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_28
    move-object/from16 v0, p1

    array-length v4, v0

    move/from16 v0, v16

    if-ge v0, v4, :cond_4e

    .line 100
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p1, v16

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 99
    add-int/lit8 v16, v16, 0x1

    goto :goto_28

    .line 101
    :cond_4e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, ""

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 105
    .end local v16    # "i":I
    :cond_57
    new-instance v9, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p2

    invoke-direct {v9, v0, v1, v2, v3}, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator$1;-><init>(Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_64
    .catchall {:try_start_7 .. :try_end_64} :catchall_8b

    .line 143
    .local v9, "cbh":Ljavax/security/auth/callback/CallbackHandler;
    :try_start_64
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->host:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->props:Ljava/util/Properties;

    move-object/from16 v4, p1

    move-object/from16 v5, p3

    invoke-static/range {v4 .. v9}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;
    :try_end_77
    .catch Ljavax/security/sasl/SaslException; {:try_start_64 .. :try_end_77} :catch_8e
    .catchall {:try_start_64 .. :try_end_77} :catchall_8b

    move-result-object v24

    .line 149
    .local v24, "sc":Ljavax/security/sasl/SaslClient;
    if-nez v24, :cond_a8

    .line 150
    :try_start_7a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "No SASL support"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 151
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    const-string v5, "No SASL support"

    invoke-direct {v4, v5}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 293
    .end local v9    # "cbh":Ljavax/security/auth/callback/CallbackHandler;
    .end local v14    # "done":Z
    .end local v22    # "r":Lcom/sun/mail/iap/Response;
    .end local v24    # "sc":Ljavax/security/sasl/SaslClient;
    .end local v26    # "tag":Ljava/lang/String;
    .end local v27    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :catchall_8b
    move-exception v4

    monitor-exit v28
    :try_end_8d
    .catchall {:try_start_7a .. :try_end_8d} :catchall_8b

    throw v4

    .line 145
    .restart local v9    # "cbh":Ljavax/security/auth/callback/CallbackHandler;
    .restart local v14    # "done":Z
    .restart local v22    # "r":Lcom/sun/mail/iap/Response;
    .restart local v26    # "tag":Ljava/lang/String;
    .restart local v27    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/iap/Response;>;"
    :catch_8e
    move-exception v25

    .line 146
    .local v25, "sex":Ljavax/security/sasl/SaslException;
    :try_start_8f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "Failed to create SASL client"

    move-object/from16 v0, v25

    invoke-virtual {v4, v5, v6, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 147
    new-instance v4, Ljava/lang/UnsupportedOperationException;

    invoke-virtual/range {v25 .. v25}, Ljavax/security/sasl/SaslException;->getMessage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-direct {v4, v5, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 153
    .end local v25    # "sex":Ljavax/security/sasl/SaslException;
    .restart local v24    # "sc":Ljavax/security/sasl/SaslClient;
    :cond_a8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_d2

    .line 154
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL client "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->getMechanismName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_d2
    .catchall {:try_start_8f .. :try_end_d2} :catchall_8b

    .line 157
    :cond_d2
    :try_start_d2
    new-instance v11, Lcom/sun/mail/iap/Argument;

    invoke-direct {v11}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 158
    .local v11, "args":Lcom/sun/mail/iap/Argument;
    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->getMechanismName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 159
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v5, "SASL-IR"

    invoke-virtual {v4, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10b

    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v4

    if-eqz v4, :cond_10b

    .line 161
    const/4 v4, 0x0

    new-array v4, v4, [B

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v12

    .line 162
    .local v12, "ba":[B
    array-length v4, v12

    if-lez v4, :cond_1e8

    .line 163
    invoke-static {v12}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v12

    .line 164
    const/4 v4, 0x0

    array-length v5, v12

    invoke-static {v12, v4, v5}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v18

    .line 167
    .local v18, "irs":Ljava/lang/String;
    :goto_106
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lcom/sun/mail/iap/Argument;->writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 169
    .end local v12    # "ba":[B
    .end local v18    # "irs":Ljava/lang/String;
    :cond_10b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v5, "AUTHENTICATE"

    invoke-virtual {v4, v5, v11}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    :try_end_114
    .catch Ljava/lang/Exception; {:try_start_d2 .. :try_end_114} :catch_1ec
    .catchall {:try_start_d2 .. :try_end_114} :catchall_8b

    move-result-object v26

    .line 175
    :try_start_115
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getIMAPOutputStream()Ljava/io/OutputStream;

    move-result-object v20

    .line 190
    .local v20, "os":Ljava/io/OutputStream;
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 191
    .local v13, "bos":Ljava/io/ByteArrayOutputStream;
    const/4 v4, 0x2

    new-array v10, v4, [B

    fill-array-data v10, :array_31c

    .line 197
    .local v10, "CRLF":[B
    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->getMechanismName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "XGWTRUSTEDAPP"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1fb

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->props:Ljava/util/Properties;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".sasl.xgwtrustedapphack.enable"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    .line 198
    invoke-static {v4, v5, v6}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z
    :try_end_159
    .catchall {:try_start_115 .. :try_end_159} :catchall_8b

    move-result v4

    if-eqz v4, :cond_1fb

    const/16 v19, 0x1

    .line 200
    .local v19, "isXGWTRUSTEDAPP":Z
    :goto_15e
    if-nez v14, :cond_27e

    .line 202
    :try_start_160
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v22

    .line 203
    invoke-virtual/range {v22 .. v22}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v4

    if-eqz v4, :cond_257

    .line 204
    const/4 v12, 0x0

    .line 205
    .restart local v12    # "ba":[B
    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->isComplete()Z

    move-result v4

    if-nez v4, :cond_1bc

    .line 206
    invoke-virtual/range {v22 .. v22}, Lcom/sun/mail/iap/Response;->readByteArray()Lcom/sun/mail/iap/ByteArray;

    move-result-object v4

    invoke-virtual {v4}, Lcom/sun/mail/iap/ByteArray;->getNewBytes()[B

    move-result-object v12

    .line 207
    array-length v4, v12

    if-lez v4, :cond_184

    .line 208
    invoke-static {v12}, Lcom/sun/mail/util/BASE64DecoderStream;->decode([B)[B

    move-result-object v12

    .line 209
    :cond_184
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_1b6

    .line 210
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL challenge: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    array-length v7, v12

    .line 211
    invoke-static {v12, v6, v7}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 210
    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 212
    :cond_1b6
    move-object/from16 v0, v24

    invoke-interface {v0, v12}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v12

    .line 214
    :cond_1bc
    if-nez v12, :cond_1ff

    .line 215
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL no response"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 216
    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/io/OutputStream;->write([B)V

    .line 217
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->flush()V

    .line 218
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_1d2
    .catch Ljava/lang/Exception; {:try_start_160 .. :try_end_1d2} :catch_1d3
    .catchall {:try_start_160 .. :try_end_1d2} :catchall_8b

    goto :goto_15e

    .line 240
    .end local v12    # "ba":[B
    :catch_1d3
    move-exception v17

    .line 241
    .local v17, "ioex":Ljava/lang/Exception;
    :try_start_1d4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "SASL Exception"

    move-object/from16 v0, v17

    invoke-virtual {v4, v5, v6, v0}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 243
    invoke-static/range {v17 .. v17}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    :try_end_1e4
    .catchall {:try_start_1d4 .. :try_end_1e4} :catchall_8b

    move-result-object v22

    .line 244
    const/4 v14, 0x1

    .line 246
    goto/16 :goto_15e

    .line 166
    .end local v10    # "CRLF":[B
    .end local v13    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v17    # "ioex":Ljava/lang/Exception;
    .end local v19    # "isXGWTRUSTEDAPP":Z
    .end local v20    # "os":Ljava/io/OutputStream;
    .restart local v12    # "ba":[B
    :cond_1e8
    :try_start_1e8
    const-string v18, "="
    :try_end_1ea
    .catch Ljava/lang/Exception; {:try_start_1e8 .. :try_end_1ea} :catch_1ec
    .catchall {:try_start_1e8 .. :try_end_1ea} :catchall_8b

    .restart local v18    # "irs":Ljava/lang/String;
    goto/16 :goto_106

    .line 170
    .end local v11    # "args":Lcom/sun/mail/iap/Argument;
    .end local v12    # "ba":[B
    .end local v18    # "irs":Ljava/lang/String;
    :catch_1ec
    move-exception v15

    .line 171
    .local v15, "ex":Ljava/lang/Exception;
    :try_start_1ed
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "SASL AUTHENTICATE Exception"

    invoke-virtual {v4, v5, v6, v15}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 172
    const/4 v4, 0x0

    monitor-exit v28
    :try_end_1fa
    .catchall {:try_start_1ed .. :try_end_1fa} :catchall_8b

    .line 292
    .end local v15    # "ex":Ljava/lang/Exception;
    :goto_1fa
    return v4

    .line 198
    .restart local v10    # "CRLF":[B
    .restart local v11    # "args":Lcom/sun/mail/iap/Argument;
    .restart local v13    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local v20    # "os":Ljava/io/OutputStream;
    :cond_1fb
    const/16 v19, 0x0

    goto/16 :goto_15e

    .line 220
    .restart local v12    # "ba":[B
    .restart local v19    # "isXGWTRUSTEDAPP":Z
    :cond_1ff
    :try_start_1ff
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_231

    .line 221
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    array-length v7, v12

    .line 222
    invoke-static {v12, v6, v7}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 221
    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 223
    :cond_231
    invoke-static {v12}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v12

    .line 224
    if-eqz v19, :cond_240

    .line 225
    const-string v4, "XGWTRUSTEDAPP "

    invoke-static {v4}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 226
    :cond_240
    invoke-virtual {v13, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 228
    invoke-virtual {v13, v10}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 229
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/io/OutputStream;->write([B)V

    .line 230
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStream;->flush()V

    .line 231
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->reset()V

    goto/16 :goto_15e

    .line 233
    .end local v12    # "ba":[B
    :cond_257
    invoke-virtual/range {v22 .. v22}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v4

    if-eqz v4, :cond_26c

    invoke-virtual/range {v22 .. v22}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26c

    .line 235
    const/4 v14, 0x1

    goto/16 :goto_15e

    .line 236
    :cond_26c
    invoke-virtual/range {v22 .. v22}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v4

    if-eqz v4, :cond_275

    .line 237
    const/4 v14, 0x1

    goto/16 :goto_15e

    .line 239
    :cond_275
    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_27c
    .catch Ljava/lang/Exception; {:try_start_1ff .. :try_end_27c} :catch_1d3
    .catchall {:try_start_1ff .. :try_end_27c} :catchall_8b

    goto/16 :goto_15e

    .line 249
    :cond_27e
    :try_start_27e
    invoke-interface/range {v24 .. v24}, Ljavax/security/sasl/SaslClient;->isComplete()Z

    move-result v4

    if-eqz v4, :cond_2b1

    .line 250
    const-string v4, "javax.security.sasl.qop"

    move-object/from16 v0, v24

    invoke-interface {v0, v4}, Ljavax/security/sasl/SaslClient;->getNegotiatedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 251
    .local v21, "qop":Ljava/lang/String;
    if-eqz v21, :cond_2b1

    const-string v4, "auth-int"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2a4

    const-string v4, "auth-conf"

    .line 252
    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2b1

    .line 254
    :cond_2a4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "SASL Mechanism requires integrity or confidentiality"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 256
    const/4 v4, 0x0

    monitor-exit v28

    goto/16 :goto_1fa

    .line 266
    .end local v21    # "qop":Ljava/lang/String;
    :cond_2b1
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lcom/sun/mail/iap/Response;

    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v23

    check-cast v23, [Lcom/sun/mail/iap/Response;

    .line 267
    .local v23, "responses":[Lcom/sun/mail/iap/Response;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 270
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 271
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 278
    if-eqz v19, :cond_317

    if-eqz p3, :cond_317

    .line 279
    new-instance v11, Lcom/sun/mail/iap/Argument;

    .end local v11    # "args":Lcom/sun/mail/iap/Argument;
    invoke-direct {v11}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 280
    .restart local v11    # "args":Lcom/sun/mail/iap/Argument;
    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 282
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    const-string v5, "LOGIN"

    invoke-virtual {v4, v5, v11}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v23

    .line 285
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 288
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v23

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v23, v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/imap/protocol/IMAPSaslAuthenticator;->pr:Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object/from16 v0, v23

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-object v5, v23, v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setCapabilities(Lcom/sun/mail/iap/Response;)V

    .line 292
    :cond_317
    const/4 v4, 0x1

    monitor-exit v28
    :try_end_319
    .catchall {:try_start_27e .. :try_end_319} :catchall_8b

    goto/16 :goto_1fa

    .line 191
    nop

    :array_31c
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method
