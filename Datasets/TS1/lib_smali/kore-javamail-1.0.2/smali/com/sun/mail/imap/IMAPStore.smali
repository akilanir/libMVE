.class public Lcom/sun/mail/imap/IMAPStore;
.super Lkorex/mail/Store;
.source "IMAPStore.java"

# interfaces
.implements Lkorex/mail/QuotaAwareStore;
.implements Lcom/sun/mail/iap/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/imap/IMAPStore$ConnectionPool;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final ID_ADDRESS:Ljava/lang/String; = "address"

.field public static final ID_ARGUMENTS:Ljava/lang/String; = "arguments"

.field public static final ID_COMMAND:Ljava/lang/String; = "command"

.field public static final ID_DATE:Ljava/lang/String; = "date"

.field public static final ID_ENVIRONMENT:Ljava/lang/String; = "environment"

.field public static final ID_NAME:Ljava/lang/String; = "name"

.field public static final ID_OS:Ljava/lang/String; = "os"

.field public static final ID_OS_VERSION:Ljava/lang/String; = "os-version"

.field public static final ID_SUPPORT_URL:Ljava/lang/String; = "support-url"

.field public static final ID_VENDOR:Ljava/lang/String; = "vendor"

.field public static final ID_VERSION:Ljava/lang/String; = "version"

.field public static final RESPONSE:I = 0x3e8


# instance fields
.field private final appendBufferSize:I

.field protected authorizationID:Ljava/lang/String;

.field private final blksize:I

.field private volatile connectionFailed:Z

.field private final connectionFailedLock:Ljava/lang/Object;

.field private debugpassword:Z

.field private debugusername:Z

.field protected final defaultPort:I

.field private disableAuthLogin:Z

.field private disableAuthNtlm:Z

.field private disableAuthPlain:Z

.field private enableImapEvents:Z

.field private enableResponseEvents:Z

.field private enableSASL:Z

.field private enableStartTLS:Z

.field private volatile folderConstructor:Ljava/lang/reflect/Constructor;

.field private volatile folderConstructorLI:Ljava/lang/reflect/Constructor;

.field private volatile forceClose:Z

.field private forcePasswordRefresh:Z

.field private guid:Ljava/lang/String;

.field protected host:Ljava/lang/String;

.field private ignoreSize:Z

.field protected final isSSL:Z

.field protected logger:Lcom/sun/mail/util/MailLogger;

.field private messageCacheDebug:Z

.field private final minIdleTime:I

.field protected final name:Ljava/lang/String;

.field private namespaces:Lcom/sun/mail/imap/protocol/Namespaces;

.field private nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

.field protected password:Ljava/lang/String;

.field private peek:Z

.field private final pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

.field private volatile port:I

.field protected proxyAuthUser:Ljava/lang/String;

.field private requireStartTLS:Z

.field private saslMechanisms:[Ljava/lang/String;

.field protected saslRealm:Ljava/lang/String;

.field private final statusCacheTimeout:I

.field private throwSearchException:Z

.field protected user:Ljava/lang/String;

.field private usingSSL:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 164
    const-class v0, Lcom/sun/mail/imap/IMAPStore;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/imap/IMAPStore;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;

    .prologue
    .line 425
    const-string v0, "imap"

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/imap/IMAPStore;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 426
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V
    .registers 22
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "url"    # Lkorex/mail/URLName;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "isSSL"    # Z

    .prologue
    .line 438
    invoke-direct/range {p0 .. p2}, Lkorex/mail/Store;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V

    .line 201
    const/4 v13, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->port:I

    .line 213
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthLogin:Z

    .line 214
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthPlain:Z

    .line 215
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthNtlm:Z

    .line 216
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableStartTLS:Z

    .line 217
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->requireStartTLS:Z

    .line 218
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->usingSSL:Z

    .line 219
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableSASL:Z

    .line 221
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->forcePasswordRefresh:Z

    .line 223
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableResponseEvents:Z

    .line 225
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableImapEvents:Z

    .line 227
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->throwSearchException:Z

    .line 228
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->peek:Z

    .line 239
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->connectionFailed:Z

    .line 240
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->forceClose:Z

    .line 241
    new-instance v13, Ljava/lang/Object;

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->connectionFailedLock:Ljava/lang/Object;

    .line 250
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->folderConstructor:Ljava/lang/reflect/Constructor;

    .line 251
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->folderConstructorLI:Ljava/lang/reflect/Constructor;

    .line 407
    new-instance v13, Lcom/sun/mail/imap/IMAPStore$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/sun/mail/imap/IMAPStore$1;-><init>(Lcom/sun/mail/imap/IMAPStore;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    .line 439
    if-eqz p2, :cond_72

    .line 440
    invoke-virtual/range {p2 .. p2}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object p3

    .line 441
    :cond_72
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sun/mail/imap/IMAPStore;->name:Ljava/lang/String;

    .line 442
    if-nez p4, :cond_9c

    .line 443
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".ssl.enable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result p4

    .line 445
    :cond_9c
    if-eqz p4, :cond_471

    .line 446
    const/16 v13, 0x3e1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->defaultPort:I

    .line 449
    :goto_a4
    move/from16 v0, p4

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/imap/IMAPStore;->isSSL:Z

    .line 451
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Session;->getDebug()Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->debug:Z

    .line 452
    const-string v13, "mail.debug.auth.username"

    const/4 v14, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->debugusername:Z

    .line 454
    const-string v13, "mail.debug.auth.password"

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->debugpassword:Z

    .line 456
    new-instance v13, Lcom/sun/mail/util/MailLogger;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "DEBUG "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-object v16, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 457
    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-direct {v13, v14, v15, v0}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    .line 459
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".partialfetch"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v9

    .line 461
    .local v9, "partialFetch":Z
    if-nez v9, :cond_479

    .line 462
    const/4 v13, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->blksize:I

    .line 463
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "mail.imap.partialfetch: false"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 471
    :cond_12a
    :goto_12a
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".ignorebodystructuresize"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->ignoreSize:Z

    .line 473
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_17a

    .line 474
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.ignorebodystructuresize: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/sun/mail/imap/IMAPStore;->ignoreSize:Z

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 476
    :cond_17a
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".statuscachetimeout"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x3e8

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->statusCacheTimeout:I

    .line 478
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_1cb

    .line 479
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.statuscachetimeout: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPStore;->statusCacheTimeout:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 482
    :cond_1cb
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".appendbuffersize"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->appendBufferSize:I

    .line 484
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_21b

    .line 485
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.appendbuffersize: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPStore;->appendBufferSize:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 487
    :cond_21b
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".minidletime"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0xa

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->minIdleTime:I

    .line 489
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_26c

    .line 490
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.minidletime: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPStore;->minIdleTime:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 493
    :cond_26c
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".proxyauth.user"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 494
    .local v10, "s":Ljava/lang/String;
    if-eqz v10, :cond_2bd

    .line 495
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    .line 496
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_2bd

    .line 497
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.proxyauth.user: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 501
    :cond_2bd
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".auth.login.disable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthLogin:Z

    .line 503
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthLogin:Z

    if-eqz v13, :cond_2f2

    .line 504
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "disable AUTH=LOGIN"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 507
    :cond_2f2
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".auth.plain.disable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthPlain:Z

    .line 509
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthPlain:Z

    if-eqz v13, :cond_327

    .line 510
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "disable AUTH=PLAIN"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 513
    :cond_327
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".auth.ntlm.disable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthNtlm:Z

    .line 515
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->disableAuthNtlm:Z

    if-eqz v13, :cond_35c

    .line 516
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "disable AUTH=NTLM"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 519
    :cond_35c
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".starttls.enable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableStartTLS:Z

    .line 521
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableStartTLS:Z

    if-eqz v13, :cond_391

    .line 522
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "enable STARTTLS"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 525
    :cond_391
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".starttls.required"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->requireStartTLS:Z

    .line 527
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->requireStartTLS:Z

    if-eqz v13, :cond_3c6

    .line 528
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "require STARTTLS"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 531
    :cond_3c6
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".sasl.enable"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableSASL:Z

    .line 533
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableSASL:Z

    if-eqz v13, :cond_3fb

    .line 534
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "enable SASL"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 537
    :cond_3fb
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableSASL:Z

    if-eqz v13, :cond_4dd

    .line 538
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".sasl.mechanisms"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 539
    if-eqz v10, :cond_4dd

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_4dd

    .line 540
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_450

    .line 541
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SASL mechanisms allowed: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 542
    :cond_450
    new-instance v12, Ljava/util/Vector;

    const/4 v13, 0x5

    invoke-direct {v12, v13}, Ljava/util/Vector;-><init>(I)V

    .line 543
    .local v12, "v":Ljava/util/Vector;
    new-instance v11, Ljava/util/StringTokenizer;

    const-string v13, " ,"

    invoke-direct {v11, v10, v13}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .local v11, "st":Ljava/util/StringTokenizer;
    :cond_45d
    :goto_45d
    invoke-virtual {v11}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v13

    if-eqz v13, :cond_4cc

    .line 545
    invoke-virtual {v11}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 546
    .local v8, "m":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_45d

    .line 547
    invoke-virtual {v12, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_45d

    .line 448
    .end local v8    # "m":Ljava/lang/String;
    .end local v9    # "partialFetch":Z
    .end local v10    # "s":Ljava/lang/String;
    .end local v11    # "st":Ljava/util/StringTokenizer;
    .end local v12    # "v":Ljava/util/Vector;
    :cond_471
    const/16 v13, 0x8f

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->defaultPort:I

    goto/16 :goto_a4

    .line 465
    .restart local v9    # "partialFetch":Z
    :cond_479
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".fetchsize"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x4000

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v13

    move-object/from16 v0, p0

    iput v13, v0, Lcom/sun/mail/imap/IMAPStore;->blksize:I

    .line 467
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v13

    if-eqz v13, :cond_12a

    .line 468
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mail.imap.fetchsize: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget v15, v0, Lcom/sun/mail/imap/IMAPStore;->blksize:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    goto/16 :goto_12a

    .line 549
    .restart local v10    # "s":Ljava/lang/String;
    .restart local v11    # "st":Ljava/util/StringTokenizer;
    .restart local v12    # "v":Ljava/util/Vector;
    :cond_4cc
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v13

    new-array v13, v13, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->saslMechanisms:[Ljava/lang/String;

    .line 550
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->saslMechanisms:[Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 555
    .end local v11    # "st":Ljava/util/StringTokenizer;
    .end local v12    # "v":Ljava/util/Vector;
    :cond_4dd
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".sasl.authorizationid"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 556
    if-eqz v10, :cond_515

    .line 557
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/sun/mail/imap/IMAPStore;->authorizationID:Ljava/lang/String;

    .line 558
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "mail.imap.sasl.authorizationid: {0}"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPStore;->authorizationID:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 563
    :cond_515
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".sasl.realm"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 564
    if-eqz v10, :cond_54d

    .line 565
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/sun/mail/imap/IMAPStore;->saslRealm:Ljava/lang/String;

    .line 566
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "mail.imap.sasl.realm: {0}"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPStore;->saslRealm:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 570
    :cond_54d
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".forcepasswordrefresh"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->forcePasswordRefresh:Z

    .line 572
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->forcePasswordRefresh:Z

    if-eqz v13, :cond_582

    .line 573
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "enable forcePasswordRefresh"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 576
    :cond_582
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".enableresponseevents"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableResponseEvents:Z

    .line 578
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableResponseEvents:Z

    if-eqz v13, :cond_5b7

    .line 579
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "enable IMAP response events"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 582
    :cond_5b7
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".enableimapevents"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableImapEvents:Z

    .line 584
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->enableImapEvents:Z

    if-eqz v13, :cond_5ec

    .line 585
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "enable IMAP IDLE events"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 588
    :cond_5ec
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".messagecache.debug"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->messageCacheDebug:Z

    .line 591
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".yahoo.guid"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->guid:Ljava/lang/String;

    .line 592
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->guid:Ljava/lang/String;

    if-eqz v13, :cond_64e

    .line 593
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "mail.imap.yahoo.guid: {0}"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/imap/IMAPStore;->guid:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 596
    :cond_64e
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".throwsearchexception"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->throwSearchException:Z

    .line 598
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->throwSearchException:Z

    if-eqz v13, :cond_683

    .line 599
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "throw SearchException"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 602
    :cond_683
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".peek"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v13, v14}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->peek:Z

    .line 604
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/sun/mail/imap/IMAPStore;->peek:Z

    if-eqz v13, :cond_6b8

    .line 605
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v14, "peek"

    invoke-virtual {v13, v14}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 607
    :cond_6b8
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mail."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".folder.class"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 608
    if-eqz v10, :cond_728

    .line 609
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "IMAP: folder class: {0}"

    invoke-virtual {v13, v14, v15, v10}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 611
    :try_start_6e6
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;
    :try_end_6ed
    .catch Ljava/lang/Exception; {:try_start_6e6 .. :try_end_6ed} :catch_740

    move-result-object v4

    .line 614
    .local v4, "cl":Ljava/lang/ClassLoader;
    const/4 v7, 0x0

    .line 619
    .local v7, "folderClass":Ljava/lang/Class;
    const/4 v13, 0x0

    :try_start_6f0
    invoke-static {v10, v13, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_6f3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6f0 .. :try_end_6f3} :catch_73a
    .catch Ljava/lang/Exception; {:try_start_6f0 .. :try_end_6f3} :catch_740

    move-result-object v7

    .line 627
    :goto_6f4
    const/4 v13, 0x4

    :try_start_6f5
    new-array v2, v13, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Ljava/lang/String;

    aput-object v14, v2, v13

    const/4 v13, 0x1

    sget-object v14, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    aput-object v14, v2, v13

    const/4 v13, 0x2

    const-class v14, Lcom/sun/mail/imap/IMAPStore;

    aput-object v14, v2, v13

    const/4 v13, 0x3

    const-class v14, Ljava/lang/Boolean;

    aput-object v14, v2, v13

    .line 629
    .local v2, "c":[Ljava/lang/Class;
    invoke-virtual {v7, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->folderConstructor:Ljava/lang/reflect/Constructor;

    .line 630
    const/4 v13, 0x2

    new-array v3, v13, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Lcom/sun/mail/imap/protocol/ListInfo;

    aput-object v14, v3, v13

    const/4 v13, 0x1

    const-class v14, Lcom/sun/mail/imap/IMAPStore;

    aput-object v14, v3, v13

    .line 631
    .local v3, "c2":[Ljava/lang/Class;
    invoke-virtual {v7, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->folderConstructorLI:Ljava/lang/reflect/Constructor;
    :try_end_728
    .catch Ljava/lang/Exception; {:try_start_6f5 .. :try_end_728} :catch_740

    .line 638
    .end local v2    # "c":[Ljava/lang/Class;
    .end local v3    # "c2":[Ljava/lang/Class;
    .end local v4    # "cl":Ljava/lang/ClassLoader;
    .end local v7    # "folderClass":Ljava/lang/Class;
    :cond_728
    :goto_728
    new-instance v13, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-direct {v13, v0, v14, v1}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;-><init>(Ljava/lang/String;Lcom/sun/mail/util/MailLogger;Lkorex/mail/Session;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 639
    return-void

    .line 620
    .restart local v4    # "cl":Ljava/lang/ClassLoader;
    .restart local v7    # "folderClass":Ljava/lang/Class;
    :catch_73a
    move-exception v6

    .line 624
    .local v6, "ex1":Ljava/lang/ClassNotFoundException;
    :try_start_73b
    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_73e
    .catch Ljava/lang/Exception; {:try_start_73b .. :try_end_73e} :catch_740

    move-result-object v7

    goto :goto_6f4

    .line 632
    .end local v4    # "cl":Ljava/lang/ClassLoader;
    .end local v6    # "ex1":Ljava/lang/ClassNotFoundException;
    .end local v7    # "folderClass":Ljava/lang/Class;
    :catch_740
    move-exception v5

    .line 633
    .local v5, "ex":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v14, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    const-string v15, "IMAP: failed to load folder class"

    invoke-virtual {v13, v14, v15, v5}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_728
.end method

.method private checkConnected()V
    .registers 3

    .prologue
    .line 1902
    sget-boolean v0, Lcom/sun/mail/imap/IMAPStore;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1903
    :cond_10
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 1904
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1905
    :cond_1e
    return-void
.end method

.method private declared-synchronized cleanup()V
    .registers 10

    .prologue
    .line 1591
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z

    move-result v6

    if-nez v6, :cond_10

    .line 1592
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "IMAPStore cleanup, not connected"

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_6d

    .line 1671
    :goto_e
    monitor-exit p0

    return-void

    .line 1603
    :cond_10
    :try_start_10
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailedLock:Ljava/lang/Object;

    monitor-enter v7
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_6d

    .line 1604
    :try_start_13
    iget-boolean v3, p0, Lcom/sun/mail/imap/IMAPStore;->forceClose:Z

    .line 1605
    .local v3, "force":Z
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPStore;->forceClose:Z

    .line 1606
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailed:Z

    .line 1607
    monitor-exit v7
    :try_end_1c
    .catchall {:try_start_13 .. :try_end_1c} :catchall_70

    .line 1608
    :try_start_1c
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 1609
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "IMAPStore cleanup, force "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1611
    :cond_3e
    const/4 v2, 0x0

    .line 1612
    .local v2, "foldersCopy":Ljava/util/Vector;
    const/4 v0, 0x1

    .line 1624
    .local v0, "done":Z
    :cond_40
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v7
    :try_end_43
    .catchall {:try_start_1c .. :try_end_43} :catchall_6d

    .line 1625
    :try_start_43
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    if-eqz v6, :cond_73

    .line 1626
    const/4 v0, 0x0

    .line 1627
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    .line 1628
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v8, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6, v8}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$402(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Ljava/util/Vector;)Ljava/util/Vector;

    .line 1632
    :goto_58
    monitor-exit v7
    :try_end_59
    .catchall {:try_start_43 .. :try_end_59} :catchall_75

    .line 1633
    if-eqz v0, :cond_78

    .line 1660
    :try_start_5b
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v7
    :try_end_5e
    .catchall {:try_start_5b .. :try_end_5e} :catchall_6d

    .line 1661
    :try_start_5e
    invoke-direct {p0, v3}, Lcom/sun/mail/imap/IMAPStore;->emptyConnectionPool(Z)V

    .line 1662
    monitor-exit v7
    :try_end_62
    .catchall {:try_start_5e .. :try_end_62} :catchall_a2

    .line 1666
    :try_start_62
    invoke-super {p0}, Lkorex/mail/Store;->close()V
    :try_end_65
    .catch Lkorex/mail/MessagingException; {:try_start_62 .. :try_end_65} :catch_a5
    .catchall {:try_start_62 .. :try_end_65} :catchall_6d

    .line 1670
    :goto_65
    :try_start_65
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "IMAPStore cleanup done"

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_6c
    .catchall {:try_start_65 .. :try_end_6c} :catchall_6d

    goto :goto_e

    .line 1591
    .end local v0    # "done":Z
    .end local v2    # "foldersCopy":Ljava/util/Vector;
    .end local v3    # "force":Z
    :catchall_6d
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1607
    :catchall_70
    move-exception v6

    :try_start_71
    monitor-exit v7
    :try_end_72
    .catchall {:try_start_71 .. :try_end_72} :catchall_70

    :try_start_72
    throw v6
    :try_end_73
    .catchall {:try_start_72 .. :try_end_73} :catchall_6d

    .line 1630
    .restart local v0    # "done":Z
    .restart local v2    # "foldersCopy":Ljava/util/Vector;
    .restart local v3    # "force":Z
    :cond_73
    const/4 v0, 0x1

    goto :goto_58

    .line 1632
    :catchall_75
    move-exception v6

    :try_start_76
    monitor-exit v7
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_75

    :try_start_77
    throw v6

    .line 1637
    :cond_78
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v4

    .local v4, "fsize":I
    :goto_7d
    if-ge v5, v4, :cond_40

    .line 1638
    invoke-virtual {v2, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/IMAPFolder;
    :try_end_85
    .catchall {:try_start_77 .. :try_end_85} :catchall_6d

    .line 1641
    .local v1, "f":Lcom/sun/mail/imap/IMAPFolder;
    if-eqz v3, :cond_94

    .line 1642
    :try_start_87
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "force folder to close"

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1646
    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPFolder;->forceClose()V

    .line 1637
    :goto_91
    add-int/lit8 v5, v5, 0x1

    goto :goto_7d

    .line 1648
    :cond_94
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v7, "close folder"

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1649
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/sun/mail/imap/IMAPFolder;->close(Z)V
    :try_end_9f
    .catch Lkorex/mail/MessagingException; {:try_start_87 .. :try_end_9f} :catch_a0
    .catch Ljava/lang/IllegalStateException; {:try_start_87 .. :try_end_9f} :catch_a7
    .catchall {:try_start_87 .. :try_end_9f} :catchall_6d

    goto :goto_91

    .line 1651
    :catch_a0
    move-exception v6

    goto :goto_91

    .line 1662
    .end local v1    # "f":Lcom/sun/mail/imap/IMAPFolder;
    .end local v4    # "fsize":I
    .end local v5    # "i":I
    :catchall_a2
    move-exception v6

    :try_start_a3
    monitor-exit v7
    :try_end_a4
    .catchall {:try_start_a3 .. :try_end_a4} :catchall_a2

    :try_start_a4
    throw v6
    :try_end_a5
    .catchall {:try_start_a4 .. :try_end_a5} :catchall_6d

    .line 1667
    :catch_a5
    move-exception v6

    goto :goto_65

    .line 1653
    .restart local v1    # "f":Lcom/sun/mail/imap/IMAPFolder;
    .restart local v4    # "fsize":I
    .restart local v5    # "i":I
    :catch_a7
    move-exception v6

    goto :goto_91
.end method

.method private emptyConnectionPool(Z)V
    .registers 6
    .param p1, "force"    # Z

    .prologue
    .line 1302
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v3

    .line 1303
    :try_start_3
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->size()I
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_44

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 1304
    .local v0, "index":I
    :goto_f
    if-ltz v0, :cond_2e

    .line 1306
    :try_start_11
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1307
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 1308
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {v1, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1309
    if-eqz p1, :cond_28

    .line 1310
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 1304
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :goto_25
    add-int/lit8 v0, v0, -0x1

    goto :goto_f

    .line 1312
    .restart local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_28
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_2b
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_11 .. :try_end_2b} :catch_2c
    .catchall {:try_start_11 .. :try_end_2b} :catchall_44

    goto :goto_25

    .line 1313
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_2c
    move-exception v2

    goto :goto_25

    .line 1316
    :cond_2e
    :try_start_2e
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->removeAllElements()V

    .line 1317
    monitor-exit v3
    :try_end_38
    .catchall {:try_start_2e .. :try_end_38} :catchall_44

    .line 1319
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    const-string v3, "removed all authenticated connections from pool"

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1320
    return-void

    .line 1317
    .end local v0    # "index":I
    :catchall_44
    move-exception v2

    :try_start_45
    monitor-exit v3
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_44

    throw v2
.end method

.method private declared-synchronized getNamespaces()Lcom/sun/mail/imap/protocol/Namespaces;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1797
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V

    .line 1799
    const/4 v1, 0x0

    .line 1801
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->namespaces:Lcom/sun/mail/imap/protocol/Namespaces;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1f

    if-nez v3, :cond_16

    .line 1803
    :try_start_9
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v1

    .line 1804
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->namespace()Lcom/sun/mail/imap/protocol/Namespaces;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->namespaces:Lcom/sun/mail/imap/protocol/Namespaces;
    :try_end_13
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_9 .. :try_end_13} :catch_1a
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_9 .. :try_end_13} :catch_22
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_9 .. :try_end_13} :catch_32
    .catchall {:try_start_9 .. :try_end_13} :catchall_2d

    .line 1812
    :try_start_13
    invoke-direct {p0, v1}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 1815
    :cond_16
    :goto_16
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->namespaces:Lcom/sun/mail/imap/protocol/Namespaces;
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_1f

    monitor-exit p0

    return-object v3

    .line 1805
    :catch_1a
    move-exception v3

    .line 1812
    :try_start_1b
    invoke-direct {p0, v1}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_1f

    goto :goto_16

    .line 1797
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_1f
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1807
    .restart local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_22
    move-exception v0

    .line 1808
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_23
    new-instance v3, Lkorex/mail/StoreClosedException;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v3
    :try_end_2d
    .catchall {:try_start_23 .. :try_end_2d} :catchall_2d

    .line 1812
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_2d
    move-exception v3

    :try_start_2e
    invoke-direct {p0, v1}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v3
    :try_end_32
    .catchall {:try_start_2e .. :try_end_32} :catchall_1f

    .line 1809
    :catch_32
    move-exception v2

    .line 1810
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_33
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_3d
    .catchall {:try_start_33 .. :try_end_3d} :catchall_2d
.end method

.method private getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1051
    const/4 v2, 0x0

    .line 1053
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :goto_1
    if-nez v2, :cond_e4

    .line 1054
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v4

    .line 1055
    :try_start_6
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->waitIfIdle()V

    .line 1059
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6a

    .line 1060
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    const-string v5, "getStoreProtocol() - no connections in the pool, creating a new one"

    invoke-virtual {v3, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_20
    .catchall {:try_start_6 .. :try_end_20} :catchall_40

    .line 1063
    :try_start_20
    iget-boolean v3, p0, Lcom/sun/mail/imap/IMAPStore;->forcePasswordRefresh:Z

    if-eqz v3, :cond_27

    .line 1064
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->refreshPassword()V

    .line 1066
    :cond_27
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->host:Ljava/lang/String;

    iget v5, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    invoke-virtual {p0, v3, v5}, Lcom/sun/mail/imap/IMAPStore;->newIMAPProtocol(Ljava/lang/String;I)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 1068
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    invoke-direct {p0, v2, v3, v5}, Lcom/sun/mail/imap/IMAPStore;->login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_36} :catch_43
    .catchall {:try_start_20 .. :try_end_36} :catchall_40

    .line 1077
    :goto_36
    if-nez v2, :cond_4b

    .line 1078
    :try_start_38
    new-instance v3, Lcom/sun/mail/iap/ConnectionException;

    const-string v5, "failed to create new store connection"

    invoke-direct {v3, v5}, Lcom/sun/mail/iap/ConnectionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1115
    :catchall_40
    move-exception v3

    monitor-exit v4
    :try_end_42
    .catchall {:try_start_38 .. :try_end_42} :catchall_40

    throw v3

    .line 1069
    :catch_43
    move-exception v1

    .line 1070
    .local v1, "ex1":Ljava/lang/Exception;
    if-eqz v2, :cond_49

    .line 1072
    :try_start_46
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_49} :catch_e1
    .catchall {:try_start_46 .. :try_end_49} :catchall_40

    .line 1074
    :cond_49
    :goto_49
    const/4 v2, 0x0

    goto :goto_36

    .line 1081
    .end local v1    # "ex1":Ljava/lang/Exception;
    :cond_4b
    :try_start_4b
    invoke-virtual {v2, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1082
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1101
    :cond_57
    :goto_57
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$200(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z
    :try_end_5c
    .catchall {:try_start_4b .. :try_end_5c} :catchall_40

    move-result v3

    if-eqz v3, :cond_cf

    .line 1105
    const/4 v2, 0x0

    .line 1106
    :try_start_60
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_65
    .catch Ljava/lang/InterruptedException; {:try_start_60 .. :try_end_65} :catch_e5
    .catchall {:try_start_60 .. :try_end_65} :catchall_40

    .line 1114
    :goto_65
    :try_start_65
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->timeoutConnections()V

    .line 1115
    monitor-exit v4

    goto :goto_1

    .line 1086
    :cond_6a
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_9e

    .line 1087
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getStoreProtocol() - connection available -- size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1089
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1087
    invoke-virtual {v3, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1090
    :cond_9e
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object v2, v0

    .line 1093
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    if-eqz v3, :cond_57

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    .line 1094
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getProxyAuthUser()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_57

    const-string v3, "X-UNAUTHENTICATE"

    .line 1095
    invoke-virtual {v2, v3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    .line 1096
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->unauthenticate()V

    .line 1097
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    invoke-direct {p0, v2, v3, v5}, Lcom/sun/mail/imap/IMAPStore;->login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_57

    .line 1109
    :cond_cf
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v5, 0x1

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z
    invoke-static {v3, v5}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$202(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Z)Z

    .line 1111
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    const-string v5, "getStoreProtocol() -- storeConnectionInUse"

    invoke-virtual {v3, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_e0
    .catchall {:try_start_65 .. :try_end_e0} :catchall_40

    goto :goto_65

    .line 1073
    .restart local v1    # "ex1":Ljava/lang/Exception;
    :catch_e1
    move-exception v3

    goto/16 :goto_49

    .line 1117
    .end local v1    # "ex1":Ljava/lang/Exception;
    :cond_e4
    return-object v2

    .line 1107
    :catch_e5
    move-exception v3

    goto/16 :goto_65
.end method

.method private login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .param p2, "u"    # Ljava/lang/String;
    .param p3, "pw"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 758
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->enableStartTLS:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->requireStartTLS:Z

    if-eqz v0, :cond_1c

    :cond_8
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isSSL()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 759
    const-string v0, "STARTTLS"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 760
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->startTLS()V

    .line 762
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capability()V

    .line 769
    :cond_1c
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 839
    :cond_22
    :goto_22
    return-void

    .line 763
    :cond_23
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->requireStartTLS:Z

    if-eqz v0, :cond_1c

    .line 764
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "STARTTLS required but not supported by server"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 765
    new-instance v0, Lcom/sun/mail/iap/ProtocolException;

    const-string v1, "STARTTLS required but not supported by server"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 773
    :cond_36
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPStore;->preLogin(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 777
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->guid:Ljava/lang/String;

    if-eqz v0, :cond_4c

    .line 778
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 779
    .local v7, "gmap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "GUID"

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->guid:Ljava/lang/String;

    invoke-interface {v7, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 780
    invoke-virtual {p1, v7}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->id(Ljava/util/Map;)Ljava/util/Map;

    .line 788
    .end local v7    # "gmap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4c
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getCapabilities()Ljava/util/Map;

    move-result-object v0

    const-string v1, "__PRELOGIN__"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 790
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->authorizationID:Ljava/lang/String;

    if-eqz v0, :cond_97

    .line 791
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->authorizationID:Ljava/lang/String;

    .line 797
    .local v3, "authzid":Ljava/lang/String;
    :goto_5d
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->enableSASL:Z

    if-eqz v0, :cond_7a

    .line 799
    :try_start_61
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->saslMechanisms:[Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->saslRealm:Ljava/lang/String;

    move-object v0, p1

    move-object v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->sasllogin([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 800
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isAuthenticated()Z

    move-result v0

    if-nez v0, :cond_7a

    .line 801
    new-instance v0, Lcom/sun/mail/iap/CommandFailedException;

    const-string v1, "SASL authentication failed"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/CommandFailedException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_79
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_61 .. :try_end_79} :catch_79

    .line 803
    :catch_79
    move-exception v0

    .line 808
    :cond_7a
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_a0

    .line 822
    :goto_80
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    if-eqz v0, :cond_89

    .line 823
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->proxyauth(Ljava/lang/String;)V

    .line 829
    :cond_89
    const-string v0, "__PRELOGIN__"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 831
    :try_start_91
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->capability()V
    :try_end_94
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_91 .. :try_end_94} :catch_95
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_91 .. :try_end_94} :catch_ec

    goto :goto_22

    .line 832
    :catch_95
    move-exception v6

    .line 833
    .local v6, "cex":Lcom/sun/mail/iap/ConnectionException;
    throw v6

    .line 792
    .end local v3    # "authzid":Ljava/lang/String;
    .end local v6    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :cond_97
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    if-eqz v0, :cond_9e

    .line 793
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    .restart local v3    # "authzid":Ljava/lang/String;
    goto :goto_5d

    .line 795
    .end local v3    # "authzid":Ljava/lang/String;
    :cond_9e
    const/4 v3, 0x0

    .restart local v3    # "authzid":Ljava/lang/String;
    goto :goto_5d

    .line 810
    :cond_a0
    const-string v0, "AUTH=PLAIN"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b0

    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->disableAuthPlain:Z

    if-nez v0, :cond_b0

    .line 811
    invoke-virtual {p1, v3, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authplain(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_80

    .line 812
    :cond_b0
    const-string v0, "AUTH-LOGIN"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c0

    const-string v0, "AUTH=LOGIN"

    .line 813
    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c8

    :cond_c0
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->disableAuthLogin:Z

    if-nez v0, :cond_c8

    .line 814
    invoke-virtual {p1, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authlogin(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_80

    .line 815
    :cond_c8
    const-string v0, "AUTH=NTLM"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d8

    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->disableAuthNtlm:Z

    if-nez v0, :cond_d8

    .line 816
    invoke-virtual {p1, v3, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->authntlm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_80

    .line 817
    :cond_d8
    const-string v0, "LOGINDISABLED"

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e4

    .line 818
    invoke-virtual {p1, p2, p3}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->login(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_80

    .line 820
    :cond_e4
    new-instance v0, Lcom/sun/mail/iap/ProtocolException;

    const-string v1, "No login methods supported!"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 835
    :catch_ec
    move-exception v0

    goto/16 :goto_22
.end method

.method private namespaceToFolders([Lcom/sun/mail/imap/protocol/Namespaces$Namespace;Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 10
    .param p1, "ns"    # [Lcom/sun/mail/imap/protocol/Namespaces$Namespace;
    .param p2, "user"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1820
    array-length v4, p1

    new-array v0, v4, [Lkorex/mail/Folder;

    .line 1821
    .local v0, "fa":[Lkorex/mail/Folder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v4, v0

    if-ge v1, v4, :cond_4e

    .line 1822
    aget-object v4, p1, v1

    iget-object v3, v4, Lcom/sun/mail/imap/protocol/Namespaces$Namespace;->prefix:Ljava/lang/String;

    .line 1823
    .local v3, "name":Ljava/lang/String;
    if-nez p2, :cond_3a

    .line 1825
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    .line 1826
    .local v2, "len":I
    if-lez v2, :cond_26

    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    aget-object v6, p1, v1

    iget-char v6, v6, Lcom/sun/mail/imap/protocol/Namespaces$Namespace;->delimiter:C

    if-ne v4, v6, :cond_26

    .line 1827
    add-int/lit8 v4, v2, -0x1

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1832
    .end local v2    # "len":I
    :cond_26
    :goto_26
    aget-object v4, p1, v1

    iget-char v6, v4, Lcom/sun/mail/imap/protocol/Namespaces$Namespace;->delimiter:C

    if-nez p2, :cond_4c

    const/4 v4, 0x1

    .line 1833
    :goto_2d
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 1832
    invoke-virtual {p0, v3, v6, v4}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;CLjava/lang/Boolean;)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v4

    aput-object v4, v0, v1

    .line 1821
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1830
    :cond_3a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_26

    :cond_4c
    move v4, v5

    .line 1832
    goto :goto_2d

    .line 1835
    .end local v3    # "name":Ljava/lang/String;
    :cond_4e
    return-object v0
.end method

.method private refreshPassword()V
    .registers 9

    .prologue
    .line 1139
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 1140
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "refresh password, user: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/sun/mail/imap/IMAPStore;->traceUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1143
    :cond_28
    :try_start_28
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->host:Ljava/lang/String;

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_2d
    .catch Ljava/net/UnknownHostException; {:try_start_28 .. :try_end_2d} :catch_4a

    move-result-object v1

    .line 1147
    .local v1, "addr":Ljava/net/InetAddress;
    :goto_2e
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->session:Lkorex/mail/Session;

    iget v2, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->name:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    .line 1148
    invoke-virtual/range {v0 .. v5}, Lkorex/mail/Session;->requestPasswordAuthentication(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/PasswordAuthentication;

    move-result-object v7

    .line 1150
    .local v7, "pa":Lkorex/mail/PasswordAuthentication;
    if-eqz v7, :cond_49

    .line 1151
    invoke-virtual {v7}, Lkorex/mail/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    .line 1152
    invoke-virtual {v7}, Lkorex/mail/PasswordAuthentication;->getPassword()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    .line 1154
    :cond_49
    return-void

    .line 1144
    .end local v1    # "addr":Ljava/net/InetAddress;
    .end local v7    # "pa":Lkorex/mail/PasswordAuthentication;
    :catch_4a
    move-exception v6

    .line 1145
    .local v6, "e":Ljava/net/UnknownHostException;
    const/4 v1, 0x0

    .restart local v1    # "addr":Ljava/net/InetAddress;
    goto :goto_2e
.end method

.method private releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    .registers 6
    .param p1, "protocol"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .prologue
    .line 1244
    if-nez p1, :cond_6

    .line 1245
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->cleanup()V

    .line 1277
    :cond_5
    :goto_5
    return-void

    .line 1254
    :cond_6
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailedLock:Ljava/lang/Object;

    monitor-enter v2

    .line 1255
    :try_start_9
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailed:Z

    .line 1256
    .local v0, "failed":Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailed:Z

    .line 1257
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_3e

    .line 1260
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v2

    .line 1261
    :try_start_12
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v3, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z
    invoke-static {v1, v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$202(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Z)Z

    .line 1262
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1264
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v1}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v1

    const-string v3, "releaseStoreProtocol()"

    invoke-virtual {v1, v3}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1266
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->timeoutConnections()V

    .line 1267
    monitor-exit v2
    :try_end_2c
    .catchall {:try_start_12 .. :try_end_2c} :catchall_41

    .line 1274
    sget-boolean v1, Lcom/sun/mail/imap/IMAPStore;->$assertionsDisabled:Z

    if-nez v1, :cond_44

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-static {v1}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1257
    .end local v0    # "failed":Z
    :catchall_3e
    move-exception v1

    :try_start_3f
    monitor-exit v2
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v1

    .line 1267
    .restart local v0    # "failed":Z
    :catchall_41
    move-exception v1

    :try_start_42
    monitor-exit v2
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_41

    throw v1

    .line 1275
    :cond_44
    if-eqz v0, :cond_5

    .line 1276
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->cleanup()V

    goto :goto_5
.end method

.method private timeoutConnections()V
    .registers 10

    .prologue
    .line 1327
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v3

    .line 1331
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$700(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1332
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->pruningInterval:J
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$800(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-lez v2, :cond_102

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1333
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    const/4 v4, 0x1

    if-le v2, v4, :cond_102

    .line 1335
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_7c

    .line 1336
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checking for connections to prune: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1337
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J
    invoke-static {v7}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$700(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J

    move-result-wide v7

    sub-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1336
    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1338
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clientTimeoutInterval: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1339
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J
    invoke-static {v5}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$900(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1338
    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1347
    :cond_7c
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 1348
    .local v0, "index":I
    :goto_88
    if-lez v0, :cond_f9

    .line 1349
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    .line 1350
    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 1351
    .local v1, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_c9

    .line 1352
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "protocol last used: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1353
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getTimestamp()J

    move-result-wide v7

    sub-long/2addr v5, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1352
    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1354
    :cond_c9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getTimestamp()J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1355
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->clientTimeoutInterval:J
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$900(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J

    move-result-wide v6

    cmp-long v2, v4, v6

    if-lez v2, :cond_f6

    .line 1357
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v2

    const-string v4, "authenticated connection timed out, logging out the connection"

    invoke-virtual {v2, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1361
    invoke-virtual {v1, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1362
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/Vector;->removeElementAt(I)V
    :try_end_f3
    .catchall {:try_start_3 .. :try_end_f3} :catchall_104

    .line 1365
    :try_start_f3
    invoke-virtual {v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_f6
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_f3 .. :try_end_f6} :catch_107
    .catchall {:try_start_f3 .. :try_end_f6} :catchall_104

    .line 1348
    :cond_f6
    :goto_f6
    add-int/lit8 v0, v0, -0x1

    goto :goto_88

    .line 1369
    .end local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_f9
    :try_start_f9
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->lastTimePruned:J
    invoke-static {v2, v4, v5}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$702(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;J)J

    .line 1371
    .end local v0    # "index":I
    :cond_102
    monitor-exit v3

    .line 1372
    return-void

    .line 1371
    :catchall_104
    move-exception v2

    monitor-exit v3
    :try_end_106
    .catchall {:try_start_f9 .. :try_end_106} :catchall_104

    throw v2

    .line 1366
    .restart local v0    # "index":I
    .restart local v1    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_107
    move-exception v2

    goto :goto_f6
.end method

.method private tracePassword(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 2134
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->debugpassword:Z

    if-eqz v0, :cond_5

    .end local p1    # "password":Ljava/lang/String;
    :goto_4
    return-object p1

    .restart local p1    # "password":Ljava/lang/String;
    :cond_5
    if-nez p1, :cond_a

    const-string p1, "<null>"

    goto :goto_4

    :cond_a
    const-string p1, "<non-null>"

    goto :goto_4
.end method

.method private traceUser(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 2130
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->debugusername:Z

    if-eqz v0, :cond_5

    .end local p1    # "user":Ljava/lang/String;
    :goto_4
    return-object p1

    .restart local p1    # "user":Ljava/lang/String;
    :cond_5
    const-string p1, "<user name suppressed>"

    goto :goto_4
.end method

.method private waitIfIdle()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 2056
    sget-boolean v0, Lcom/sun/mail/imap/IMAPStore;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 2057
    :cond_12
    :goto_12
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I

    move-result v0

    if-eqz v0, :cond_3a

    .line 2058
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_32

    .line 2059
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1100(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleAbort()V

    .line 2060
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v1, 0x2

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v0, v1}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 2064
    :cond_32
    :try_start_32
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_37
    .catch Ljava/lang/InterruptedException; {:try_start_32 .. :try_end_37} :catch_38

    goto :goto_12

    .line 2065
    :catch_38
    move-exception v0

    goto :goto_12

    .line 2067
    :cond_3a
    return-void
.end method


# virtual methods
.method allowReadOnlySelect()Z
    .registers 4

    .prologue
    .line 1162
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".allowreadonlyselect"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized close()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1520
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_2c

    move-result v3

    if-nez v3, :cond_9

    .line 1579
    :goto_7
    monitor-exit p0

    return-void

    .line 1523
    :cond_9
    const/4 v2, 0x0

    .line 1526
    .local v2, "protocol":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_a
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v4
    :try_end_d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_a .. :try_end_d} :catch_32
    .catchall {:try_start_a .. :try_end_d} :catchall_3d

    .line 1529
    :try_start_d
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    .line 1530
    .local v0, "isEmpty":Z
    monitor-exit v4
    :try_end_18
    .catchall {:try_start_d .. :try_end_18} :catchall_2f

    .line 1540
    if-eqz v0, :cond_42

    .line 1541
    :try_start_1a
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    const-string v4, "close() - no connections "

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1542
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->cleanup()V
    :try_end_28
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_1a .. :try_end_28} :catch_32
    .catchall {:try_start_1a .. :try_end_28} :catchall_3d

    .line 1577
    :try_start_28
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_2c

    goto :goto_7

    .line 1520
    .end local v0    # "isEmpty":Z
    .end local v2    # "protocol":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_2c
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1530
    .restart local v2    # "protocol":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_2f
    move-exception v3

    :try_start_30
    monitor-exit v4
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    :try_start_31
    throw v3
    :try_end_32
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_31 .. :try_end_32} :catch_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_3d

    .line 1573
    :catch_32
    move-exception v1

    .line 1575
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_33
    new-instance v3, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_3d
    .catchall {:try_start_33 .. :try_end_3d} :catchall_3d

    .line 1577
    .end local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_3d
    move-exception v3

    :try_start_3e
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v3
    :try_end_42
    .catchall {:try_start_3e .. :try_end_42} :catchall_2c

    .line 1546
    .restart local v0    # "isEmpty":Z
    :cond_42
    :try_start_42
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 1553
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v4
    :try_end_49
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_42 .. :try_end_49} :catch_32
    .catchall {:try_start_42 .. :try_end_49} :catchall_3d

    .line 1554
    :try_start_49
    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 1555
    monitor-exit v4
    :try_end_53
    .catchall {:try_start_49 .. :try_end_53} :catchall_5a

    .line 1572
    :try_start_53
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_56
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_53 .. :try_end_56} :catch_32
    .catchall {:try_start_53 .. :try_end_56} :catchall_3d

    .line 1577
    :try_start_56
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_2c

    goto :goto_7

    .line 1555
    :catchall_5a
    move-exception v3

    :try_start_5b
    monitor-exit v4
    :try_end_5c
    .catchall {:try_start_5b .. :try_end_5c} :catchall_5a

    :try_start_5c
    throw v3
    :try_end_5d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5c .. :try_end_5d} :catch_32
    .catchall {:try_start_5c .. :try_end_5d} :catchall_3d
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1582
    invoke-super {p0}, Lkorex/mail/Store;->finalize()V

    .line 1583
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPStore;->close()V

    .line 1584
    return-void
.end method

.method getAppendBufferSize()I
    .registers 2

    .prologue
    .line 1406
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore;->appendBufferSize:I

    return v0
.end method

.method getConnectionPoolLogger()Lcom/sun/mail/util/MailLogger;
    .registers 2

    .prologue
    .line 1177
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getDefaultFolder()Lkorex/mail/Folder;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1678
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V

    .line 1679
    new-instance v0, Lcom/sun/mail/imap/DefaultFolder;

    invoke-direct {v0, p0}, Lcom/sun/mail/imap/DefaultFolder;-><init>(Lcom/sun/mail/imap/IMAPStore;)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 1678
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getFetchBlockSize()I
    .registers 2

    .prologue
    .line 1378
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore;->blksize:I

    return v0
.end method

.method public declared-synchronized getFolder(Ljava/lang/String;)Lkorex/mail/Folder;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1687
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V

    .line 1688
    const v0, 0xffff

    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_d

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 1687
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFolder(Lkorex/mail/URLName;)Lkorex/mail/Folder;
    .registers 4
    .param p1, "url"    # Lkorex/mail/URLName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1696
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V

    .line 1697
    invoke-virtual {p1}, Lkorex/mail/URLName;->getFile()Ljava/lang/String;

    move-result-object v0

    const v1, 0xffff

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_11

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 1696
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getFolderStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 1124
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 1125
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-virtual {v0, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1126
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1127
    return-object v0
.end method

.method getMessageCacheDebug()Z
    .registers 2

    .prologue
    .line 1184
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->messageCacheDebug:Z

    return v0
.end method

.method getMinIdleTime()I
    .registers 2

    .prologue
    .line 1413
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore;->minIdleTime:I

    return v0
.end method

.method getPeek()Z
    .registers 2

    .prologue
    .line 1427
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->peek:Z

    return v0
.end method

.method public getPersonalNamespaces()[Lkorex/mail/Folder;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1767
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getNamespaces()Lcom/sun/mail/imap/protocol/Namespaces;

    move-result-object v0

    .line 1768
    .local v0, "ns":Lcom/sun/mail/imap/protocol/Namespaces;
    if-eqz v0, :cond_a

    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->personal:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    if-nez v1, :cond_f

    .line 1769
    :cond_a
    invoke-super {p0}, Lkorex/mail/Store;->getPersonalNamespaces()[Lkorex/mail/Folder;

    move-result-object v1

    .line 1770
    :goto_e
    return-object v1

    :cond_f
    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->personal:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/imap/IMAPStore;->namespaceToFolders([Lcom/sun/mail/imap/protocol/Namespaces$Namespace;Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v1

    goto :goto_e
.end method

.method getProtocol(Lcom/sun/mail/imap/IMAPFolder;)Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 14
    .param p1, "folder"    # Lcom/sun/mail/imap/IMAPFolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 910
    const/4 v4, 0x0

    .line 913
    .local v4, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :goto_1
    if-nez v4, :cond_154

    .line 921
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v7

    .line 925
    :try_start_6
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2f

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 926
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v6

    const/4 v8, 0x1

    if-ne v6, v8, :cond_6b

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 927
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->separateStoreConnection:Z
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$100(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z

    move-result v6

    if-nez v6, :cond_2f

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$200(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z

    move-result v6

    if-eqz v6, :cond_6b

    .line 929
    :cond_2f
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v8, "no connections in the pool, creating a new one"

    invoke-virtual {v6, v8}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_36
    .catchall {:try_start_6 .. :try_end_36} :catchall_60

    .line 931
    :try_start_36
    iget-boolean v6, p0, Lcom/sun/mail/imap/IMAPStore;->forcePasswordRefresh:Z

    if-eqz v6, :cond_3d

    .line 932
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->refreshPassword()V

    .line 934
    :cond_3d
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->host:Ljava/lang/String;

    iget v8, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    invoke-virtual {p0, v6, v8}, Lcom/sun/mail/imap/IMAPStore;->newIMAPProtocol(Ljava/lang/String;I)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v4

    .line 935
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 937
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    invoke-direct {p0, v4, v6, v8}, Lcom/sun/mail/imap/IMAPStore;->login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_56} :catch_63
    .catchall {:try_start_36 .. :try_end_56} :catchall_60

    .line 947
    :goto_56
    if-nez v4, :cond_10a

    .line 948
    :try_start_58
    new-instance v6, Lkorex/mail/MessagingException;

    const-string v8, "connection failure"

    invoke-direct {v6, v8}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1025
    :catchall_60
    move-exception v6

    monitor-exit v7
    :try_end_62
    .catchall {:try_start_58 .. :try_end_62} :catchall_60

    throw v6

    .line 939
    :catch_63
    move-exception v1

    .line 940
    .local v1, "ex1":Ljava/lang/Exception;
    if-eqz v4, :cond_69

    .line 942
    :try_start_66
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_69} :catch_151
    .catchall {:try_start_66 .. :try_end_69} :catchall_60

    .line 944
    :cond_69
    :goto_69
    const/4 v4, 0x0

    goto :goto_56

    .line 950
    .end local v1    # "ex1":Ljava/lang/Exception;
    :cond_6b
    :try_start_6b
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v8}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_97

    .line 951
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "connection available -- size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 952
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 951
    invoke-virtual {v6, v8}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 955
    :cond_97
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->lastElement()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-object v4, v0

    .line 956
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 959
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getTimestamp()J

    move-result-wide v10

    sub-long v2, v8, v10

    .line 960
    .local v2, "lastUsed":J
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->serverTimeoutInterval:J
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$300(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)J
    :try_end_bd
    .catchall {:try_start_6b .. :try_end_bd} :catchall_60

    move-result-wide v8

    cmp-long v6, v2, v8

    if-lez v6, :cond_d5

    .line 967
    :try_start_c2
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 968
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 969
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V

    .line 970
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 971
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    :try_end_d5
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_c2 .. :try_end_d5} :catch_12d
    .catchall {:try_start_c2 .. :try_end_d5} :catchall_60

    .line 985
    :cond_d5
    :try_start_d5
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    if-eqz v6, :cond_107

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    .line 986
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getProxyAuthUser()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_107

    const-string v6, "X-UNAUTHENTICATE"

    .line 987
    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z
    :try_end_ea
    .catchall {:try_start_d5 .. :try_end_ea} :catchall_60

    move-result v6

    if-eqz v6, :cond_107

    .line 994
    :try_start_ed
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 995
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 996
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->unauthenticate()V

    .line 997
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    invoke-direct {p0, v4, v6, v8}, Lcom/sun/mail/imap/IMAPStore;->login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V

    .line 998
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 999
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    :try_end_107
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_ed .. :try_end_107} :catch_13f
    .catchall {:try_start_ed .. :try_end_107} :catchall_60

    .line 1013
    :cond_107
    :try_start_107
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1017
    .end local v2    # "lastUsed":J
    :cond_10a
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->timeoutConnections()V

    .line 1020
    if-eqz p1, :cond_12a

    .line 1021
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    if-nez v6, :cond_121

    .line 1022
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6, v8}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$402(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Ljava/util/Vector;)Ljava/util/Vector;

    .line 1023
    :cond_121
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1025
    :cond_12a
    monitor-exit v7
    :try_end_12b
    .catchall {:try_start_107 .. :try_end_12b} :catchall_60

    goto/16 :goto_1

    .line 972
    .restart local v2    # "lastUsed":J
    :catch_12d
    move-exception v5

    .line 974
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_12e
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 975
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V
    :try_end_136
    .catchall {:try_start_12e .. :try_end_136} :catchall_13a

    .line 978
    const/4 v4, 0x0

    .line 979
    :try_start_137
    monitor-exit v7

    goto/16 :goto_1

    .line 978
    :catchall_13a
    move-exception v6

    const/4 v4, 0x0

    .line 979
    monitor-exit v7
    :try_end_13d
    .catchall {:try_start_137 .. :try_end_13d} :catchall_60

    goto/16 :goto_1

    .line 1000
    .end local v5    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catch_13f
    move-exception v5

    .line 1002
    .restart local v5    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_140
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1003
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V
    :try_end_148
    .catchall {:try_start_140 .. :try_end_148} :catchall_14c

    .line 1006
    const/4 v4, 0x0

    .line 1007
    :try_start_149
    monitor-exit v7

    goto/16 :goto_1

    .line 1006
    :catchall_14c
    move-exception v6

    const/4 v4, 0x0

    .line 1007
    monitor-exit v7
    :try_end_14f
    .catchall {:try_start_149 .. :try_end_14f} :catchall_60

    goto/16 :goto_1

    .line 943
    .end local v2    # "lastUsed":J
    .end local v5    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v1    # "ex1":Ljava/lang/Exception;
    :catch_151
    move-exception v6

    goto/16 :goto_69

    .line 1029
    .end local v1    # "ex1":Ljava/lang/Exception;
    :cond_154
    return-object v4
.end method

.method public getProxyAuthUser()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1472
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getQuota(Ljava/lang/String;)[Lkorex/mail/Quota;
    .registers 9
    .param p1, "root"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1856
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_21

    .line 1857
    const/4 v4, 0x0

    .line 1859
    .local v4, "qa":[Lkorex/mail/Quota;
    const/4 v2, 0x0

    .line 1861
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_6
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 1862
    invoke-virtual {v2, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->getQuotaRoot(Ljava/lang/String;)[Lkorex/mail/Quota;
    :try_end_d
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_6 .. :try_end_d} :catch_13
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6 .. :try_end_d} :catch_24
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6 .. :try_end_d} :catch_2f
    .catchall {:try_start_6 .. :try_end_d} :catchall_1c

    move-result-object v4

    .line 1870
    :try_start_e
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_21

    .line 1872
    monitor-exit p0

    return-object v4

    .line 1863
    :catch_13
    move-exception v0

    .line 1864
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_14
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "QUOTA not supported"

    invoke-direct {v5, v6, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1c

    .line 1870
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_1c
    move-exception v5

    :try_start_1d
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v5
    :try_end_21
    .catchall {:try_start_1d .. :try_end_21} :catchall_21

    .line 1856
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v4    # "qa":[Lkorex/mail/Quota;
    :catchall_21
    move-exception v5

    monitor-exit p0

    throw v5

    .line 1865
    .restart local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v4    # "qa":[Lkorex/mail/Quota;
    :catch_24
    move-exception v1

    .line 1866
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_25
    new-instance v5, Lkorex/mail/StoreClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v5

    .line 1867
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_2f
    move-exception v3

    .line 1868
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v5, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_3a
    .catchall {:try_start_25 .. :try_end_3a} :catchall_1c
.end method

.method getSession()Lkorex/mail/Session;
    .registers 2

    .prologue
    .line 1392
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->session:Lkorex/mail/Session;

    return-object v0
.end method

.method public getSharedNamespaces()[Lkorex/mail/Folder;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1790
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getNamespaces()Lcom/sun/mail/imap/protocol/Namespaces;

    move-result-object v0

    .line 1791
    .local v0, "ns":Lcom/sun/mail/imap/protocol/Namespaces;
    if-eqz v0, :cond_a

    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->shared:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    if-nez v1, :cond_f

    .line 1792
    :cond_a
    invoke-super {p0}, Lkorex/mail/Store;->getSharedNamespaces()[Lkorex/mail/Folder;

    move-result-object v1

    .line 1793
    :goto_e
    return-object v1

    :cond_f
    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->shared:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/imap/IMAPStore;->namespaceToFolders([Lcom/sun/mail/imap/protocol/Namespaces$Namespace;Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v1

    goto :goto_e
.end method

.method getStatusCacheTimeout()I
    .registers 2

    .prologue
    .line 1399
    iget v0, p0, Lcom/sun/mail/imap/IMAPStore;->statusCacheTimeout:I

    return v0
.end method

.method public getUserNamespaces(Ljava/lang/String;)[Lkorex/mail/Folder;
    .registers 4
    .param p1, "user"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1779
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getNamespaces()Lcom/sun/mail/imap/protocol/Namespaces;

    move-result-object v0

    .line 1780
    .local v0, "ns":Lcom/sun/mail/imap/protocol/Namespaces;
    if-eqz v0, :cond_a

    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->otherUsers:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    if-nez v1, :cond_f

    .line 1781
    :cond_a
    invoke-super {p0, p1}, Lkorex/mail/Store;->getUserNamespaces(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v1

    .line 1782
    :goto_e
    return-object v1

    :cond_f
    iget-object v1, v0, Lcom/sun/mail/imap/protocol/Namespaces;->otherUsers:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    invoke-direct {p0, v1, p1}, Lcom/sun/mail/imap/IMAPStore;->namespaceToFolders([Lcom/sun/mail/imap/protocol/Namespaces$Namespace;Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v1

    goto :goto_e
.end method

.method public handleResponse(Lcom/sun/mail/iap/Response;)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    .line 1912
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBAD()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 1913
    :cond_18
    invoke-virtual {p0, p1}, Lcom/sun/mail/imap/IMAPStore;->handleResponseCode(Lcom/sun/mail/iap/Response;)V

    .line 1914
    :cond_1b
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 1915
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "IMAPStore connection dead"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1918
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1919
    const/4 v0, 0x1

    :try_start_2c
    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->connectionFailed:Z

    .line 1920
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isSynthetic()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 1921
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->forceClose:Z

    .line 1922
    :cond_37
    monitor-exit v1

    .line 1925
    :cond_38
    return-void

    .line 1922
    :catchall_39
    move-exception v0

    monitor-exit v1
    :try_end_3b
    .catchall {:try_start_2c .. :try_end_3b} :catchall_39

    throw v0
.end method

.method handleResponseCode(Lcom/sun/mail/iap/Response;)V
    .registers 7
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    .line 2108
    iget-boolean v3, p0, Lcom/sun/mail/imap/IMAPStore;->enableResponseEvents:Z

    if-eqz v3, :cond_d

    .line 2109
    const/16 v3, 0x3e8

    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/sun/mail/imap/IMAPStore;->notifyStoreListeners(ILjava/lang/String;)V

    .line 2110
    :cond_d
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v2

    .line 2111
    .local v2, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 2112
    .local v1, "isAlert":Z
    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 2113
    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 2115
    .local v0, "i":I
    if-lez v0, :cond_32

    const/4 v3, 0x0

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const-string v4, "[ALERT]"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 2116
    const/4 v1, 0x1

    .line 2118
    :cond_32
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 2120
    .end local v0    # "i":I
    :cond_3c
    if-eqz v1, :cond_43

    .line 2121
    const/4 v3, 0x1

    invoke-virtual {p0, v3, v2}, Lcom/sun/mail/imap/IMAPStore;->notifyStoreListeners(ILjava/lang/String;)V

    .line 2127
    :cond_42
    :goto_42
    return-void

    .line 2122
    :cond_43
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isUnTagged()Z

    move-result v3

    if-eqz v3, :cond_42

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_42

    .line 2126
    const/4 v3, 0x2

    invoke-virtual {p0, v3, v2}, Lcom/sun/mail/imap/IMAPStore;->notifyStoreListeners(ILjava/lang/String;)V

    goto :goto_42
.end method

.method public declared-synchronized hasCapability(Ljava/lang/String;)Z
    .registers 6
    .param p1, "capability"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1441
    monitor-enter p0

    const/4 v0, 0x0

    .line 1443
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_2
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 1444
    invoke-virtual {v0, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->hasCapability(Ljava/lang/String;)Z
    :try_end_9
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_2 .. :try_end_9} :catch_f
    .catchall {:try_start_2 .. :try_end_9} :catchall_1a

    move-result v2

    .line 1448
    :try_start_a
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_1f

    monitor-exit p0

    return v2

    .line 1445
    :catch_f
    move-exception v1

    .line 1446
    .local v1, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_10
    new-instance v2, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
    :try_end_1a
    .catchall {:try_start_10 .. :try_end_1a} :catchall_1a

    .line 1448
    .end local v1    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_1a
    move-exception v2

    :try_start_1b
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v2
    :try_end_1f
    .catchall {:try_start_1b .. :try_end_1f} :catchall_1f

    .line 1441
    :catchall_1f
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method hasSeparateStoreConnection()Z
    .registers 2

    .prologue
    .line 1170
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->separateStoreConnection:Z
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$100(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized id(Ljava/util/Map;)Ljava/util/Map;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2084
    .local p1, "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_21

    .line 2085
    const/4 v4, 0x0

    .line 2087
    .local v4, "serverParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 2089
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_6
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 2090
    invoke-virtual {v2, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->id(Ljava/util/Map;)Ljava/util/Map;
    :try_end_d
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_6 .. :try_end_d} :catch_13
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_6 .. :try_end_d} :catch_24
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_6 .. :try_end_d} :catch_2f
    .catchall {:try_start_6 .. :try_end_d} :catchall_1c

    move-result-object v4

    .line 2098
    :try_start_e
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_21

    .line 2100
    monitor-exit p0

    return-object v4

    .line 2091
    :catch_13
    move-exception v0

    .line 2092
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_14
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "ID not supported"

    invoke-direct {v5, v6, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_1c
    .catchall {:try_start_14 .. :try_end_1c} :catchall_1c

    .line 2098
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_1c
    move-exception v5

    :try_start_1d
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v5
    :try_end_21
    .catchall {:try_start_1d .. :try_end_21} :catchall_21

    .line 2084
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v4    # "serverParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_21
    move-exception v5

    monitor-exit p0

    throw v5

    .line 2093
    .restart local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v4    # "serverParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_24
    move-exception v1

    .line 2094
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_25
    new-instance v5, Lkorex/mail/StoreClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v5

    .line 2095
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_2f
    move-exception v3

    .line 2096
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v5, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
    :try_end_3a
    .catchall {:try_start_25 .. :try_end_3a} :catchall_1c
.end method

.method public idle()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1964
    const/4 v4, 0x0

    .line 1967
    .local v4, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    sget-boolean v7, Lcom/sun/mail/imap/IMAPStore;->$assertionsDisabled:Z

    if-nez v7, :cond_13

    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-static {v7}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1968
    :cond_13
    monitor-enter p0

    .line 1969
    :try_start_14
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V

    .line 1970
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_14 .. :try_end_18} :catchall_49

    .line 1971
    const/4 v3, 0x0

    .line 1973
    .local v3, "needNotification":Z
    :try_start_19
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v8
    :try_end_1c
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_19 .. :try_end_1c} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_19 .. :try_end_1c} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_19 .. :try_end_1c} :catch_f2
    .catchall {:try_start_19 .. :try_end_1c} :catchall_b2

    .line 1974
    :try_start_1c
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v4

    .line 1975
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v7}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I
    :try_end_25
    .catchall {:try_start_1c .. :try_end_25} :catchall_a6

    move-result v7

    if-eqz v7, :cond_4f

    .line 1981
    :try_start_28
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v7}, Ljava/lang/Object;->wait()V
    :try_end_2d
    .catch Ljava/lang/InterruptedException; {:try_start_28 .. :try_end_2d} :catch_105
    .catchall {:try_start_28 .. :try_end_2d} :catchall_a6

    .line 1983
    :goto_2d
    :try_start_2d
    monitor-exit v8
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_a6

    .line 2039
    if-eqz v3, :cond_45

    .line 2040
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v8

    .line 2041
    :try_start_33
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 2042
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 2043
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v7}, Ljava/lang/Object;->notifyAll()V

    .line 2044
    monitor-exit v8
    :try_end_45
    .catchall {:try_start_33 .. :try_end_45} :catchall_4c

    .line 2046
    :cond_45
    invoke-direct {p0, v4}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 2048
    :goto_48
    return-void

    .line 1970
    .end local v3    # "needNotification":Z
    :catchall_49
    move-exception v7

    :try_start_4a
    monitor-exit p0
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_49

    throw v7

    .line 2044
    .restart local v3    # "needNotification":Z
    :catchall_4c
    move-exception v7

    :try_start_4d
    monitor-exit v8
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4c

    throw v7

    .line 1985
    :cond_4f
    :try_start_4f
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->idleStart()V

    .line 1986
    const/4 v3, 0x1

    .line 1987
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x1

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 1988
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v7, v4}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 1989
    monitor-exit v8
    :try_end_5f
    .catchall {:try_start_4f .. :try_end_5f} :catchall_a6

    .line 2005
    :cond_5f
    :goto_5f
    :try_start_5f
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->readIdleResponse()Lcom/sun/mail/iap/Response;

    move-result-object v6

    .line 2006
    .local v6, "r":Lcom/sun/mail/iap/Response;
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v8
    :try_end_66
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_5f .. :try_end_66} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5f .. :try_end_66} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5f .. :try_end_66} :catch_f2
    .catchall {:try_start_5f .. :try_end_66} :catchall_b2

    .line 2007
    if-eqz v6, :cond_6e

    :try_start_68
    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->processIdleResponse(Lcom/sun/mail/iap/Response;)Z

    move-result v7

    if-nez v7, :cond_ce

    .line 2008
    :cond_6e
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 2009
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 2010
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v7}, Ljava/lang/Object;->notifyAll()V

    .line 2011
    const/4 v3, 0x0

    .line 2012
    monitor-exit v8
    :try_end_81
    .catchall {:try_start_68 .. :try_end_81} :catchall_ef

    .line 2025
    :try_start_81
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPStore;->getMinIdleTime()I
    :try_end_84
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_81 .. :try_end_84} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_81 .. :try_end_84} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_81 .. :try_end_84} :catch_f2
    .catchall {:try_start_81 .. :try_end_84} :catchall_b2

    move-result v2

    .line 2026
    .local v2, "minidle":I
    if-lez v2, :cond_8b

    .line 2028
    int-to-long v7, v2

    :try_start_88
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8b
    .catch Ljava/lang/InterruptedException; {:try_start_88 .. :try_end_8b} :catch_103
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_88 .. :try_end_8b} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_88 .. :try_end_8b} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_88 .. :try_end_8b} :catch_f2
    .catchall {:try_start_88 .. :try_end_8b} :catchall_b2

    .line 2039
    :cond_8b
    :goto_8b
    if-eqz v3, :cond_a2

    .line 2040
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v8

    .line 2041
    :try_start_90
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 2042
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v9, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v7, v9}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 2043
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v7}, Ljava/lang/Object;->notifyAll()V

    .line 2044
    monitor-exit v8
    :try_end_a2
    .catchall {:try_start_90 .. :try_end_a2} :catchall_fd

    .line 2046
    :cond_a2
    invoke-direct {p0, v4}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    goto :goto_48

    .line 1989
    .end local v2    # "minidle":I
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    :catchall_a6
    move-exception v7

    :try_start_a7
    monitor-exit v8
    :try_end_a8
    .catchall {:try_start_a7 .. :try_end_a8} :catchall_a6

    :try_start_a8
    throw v7
    :try_end_a9
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_a8 .. :try_end_a9} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_a8 .. :try_end_a9} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_a8 .. :try_end_a9} :catch_f2
    .catchall {:try_start_a8 .. :try_end_a9} :catchall_b2

    .line 2032
    :catch_a9
    move-exception v0

    .line 2033
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_aa
    new-instance v7, Lkorex/mail/MessagingException;

    const-string v8, "IDLE not supported"

    invoke-direct {v7, v8, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_b2
    .catchall {:try_start_aa .. :try_end_b2} :catchall_b2

    .line 2039
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_b2
    move-exception v7

    if-eqz v3, :cond_ca

    .line 2040
    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v8

    .line 2041
    :try_start_b8
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v10, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleState:I
    invoke-static {v9, v10}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1002(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;I)I

    .line 2042
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v10, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->idleProtocol:Lcom/sun/mail/imap/protocol/IMAPProtocol;
    invoke-static {v9, v10}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$1102(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Lcom/sun/mail/imap/protocol/IMAPProtocol;)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .line 2043
    iget-object v9, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v9}, Ljava/lang/Object;->notifyAll()V

    .line 2044
    monitor-exit v8
    :try_end_ca
    .catchall {:try_start_b8 .. :try_end_ca} :catchall_100

    .line 2046
    :cond_ca
    invoke-direct {p0, v4}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v7

    .line 2014
    .restart local v6    # "r":Lcom/sun/mail/iap/Response;
    :cond_ce
    :try_start_ce
    monitor-exit v8
    :try_end_cf
    .catchall {:try_start_ce .. :try_end_cf} :catchall_ef

    .line 2015
    :try_start_cf
    iget-boolean v7, p0, Lcom/sun/mail/imap/IMAPStore;->enableImapEvents:Z

    if-eqz v7, :cond_5f

    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isUnTagged()Z

    move-result v7

    if-eqz v7, :cond_5f

    .line 2016
    const/16 v7, 0x3e8

    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v7, v8}, Lcom/sun/mail/imap/IMAPStore;->notifyStoreListeners(ILjava/lang/String;)V
    :try_end_e2
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_cf .. :try_end_e2} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_cf .. :try_end_e2} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_cf .. :try_end_e2} :catch_f2
    .catchall {:try_start_cf .. :try_end_e2} :catchall_b2

    goto/16 :goto_5f

    .line 2034
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    :catch_e4
    move-exception v1

    .line 2035
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_e5
    new-instance v7, Lkorex/mail/StoreClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v7
    :try_end_ef
    .catchall {:try_start_e5 .. :try_end_ef} :catchall_b2

    .line 2014
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    .restart local v6    # "r":Lcom/sun/mail/iap/Response;
    :catchall_ef
    move-exception v7

    :try_start_f0
    monitor-exit v8
    :try_end_f1
    .catchall {:try_start_f0 .. :try_end_f1} :catchall_ef

    :try_start_f1
    throw v7
    :try_end_f2
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_f1 .. :try_end_f2} :catch_a9
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_f1 .. :try_end_f2} :catch_e4
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_f1 .. :try_end_f2} :catch_f2
    .catchall {:try_start_f1 .. :try_end_f2} :catchall_b2

    .line 2036
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    :catch_f2
    move-exception v5

    .line 2037
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_f3
    new-instance v7, Lkorex/mail/MessagingException;

    invoke-virtual {v5}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
    :try_end_fd
    .catchall {:try_start_f3 .. :try_end_fd} :catchall_b2

    .line 2044
    .end local v5    # "pex":Lcom/sun/mail/iap/ProtocolException;
    .restart local v2    # "minidle":I
    .restart local v6    # "r":Lcom/sun/mail/iap/Response;
    :catchall_fd
    move-exception v7

    :try_start_fe
    monitor-exit v8
    :try_end_ff
    .catchall {:try_start_fe .. :try_end_ff} :catchall_fd

    throw v7

    .end local v2    # "minidle":I
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    :catchall_100
    move-exception v7

    :try_start_101
    monitor-exit v8
    :try_end_102
    .catchall {:try_start_101 .. :try_end_102} :catchall_100

    throw v7

    .line 2029
    .restart local v2    # "minidle":I
    .restart local v6    # "r":Lcom/sun/mail/iap/Response;
    :catch_103
    move-exception v7

    goto :goto_8b

    .line 1982
    .end local v2    # "minidle":I
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    :catch_105
    move-exception v7

    goto/16 :goto_2d
.end method

.method ignoreBodyStructureSize()Z
    .registers 2

    .prologue
    .line 1385
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->ignoreSize:Z

    return v0
.end method

.method public declared-synchronized isConnected()Z
    .registers 3

    .prologue
    .line 1480
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_1f

    move-result v1

    if-nez v1, :cond_a

    .line 1483
    const/4 v1, 0x0

    .line 1513
    :goto_8
    monitor-exit p0

    return v1

    .line 1502
    :cond_a
    const/4 v0, 0x0

    .line 1504
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_b
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 1505
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V
    :try_end_12
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_b .. :try_end_12} :catch_1a
    .catchall {:try_start_b .. :try_end_12} :catchall_22

    .line 1509
    :try_start_12
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    .line 1513
    :goto_15
    invoke-super {p0}, Lkorex/mail/Store;->isConnected()Z

    move-result v1

    goto :goto_8

    .line 1506
    :catch_1a
    move-exception v1

    .line 1509
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_1e
    .catchall {:try_start_12 .. :try_end_1e} :catchall_1f

    goto :goto_15

    .line 1480
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_1f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1509
    .restart local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_22
    move-exception v1

    :try_start_23
    invoke-direct {p0, v0}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v1
    :try_end_27
    .catchall {:try_start_23 .. :try_end_27} :catchall_1f
.end method

.method isConnectionPoolFull()Z
    .registers 5

    .prologue
    .line 1192
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v1

    .line 1193
    :try_start_3
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 1194
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "connection pool current size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1195
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "   pool size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1196
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$600(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1194
    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1198
    :cond_47
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->poolSize:I
    invoke-static {v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$600(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)I

    move-result v2

    if-lt v0, v2, :cond_5c

    const/4 v0, 0x1

    :goto_5a
    monitor-exit v1

    return v0

    :cond_5c
    const/4 v0, 0x0

    goto :goto_5a

    .line 1200
    :catchall_5e
    move-exception v0

    monitor-exit v1
    :try_end_60
    .catchall {:try_start_3 .. :try_end_60} :catchall_5e

    throw v0
.end method

.method public declared-synchronized isSSL()Z
    .registers 2

    .prologue
    .line 865
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->usingSSL:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected newIMAPFolder(Lcom/sun/mail/imap/protocol/ListInfo;)Lcom/sun/mail/imap/IMAPFolder;
    .registers 9
    .param p1, "li"    # Lcom/sun/mail/imap/protocol/ListInfo;

    .prologue
    .line 1747
    const/4 v2, 0x0

    .line 1748
    .local v2, "f":Lcom/sun/mail/imap/IMAPFolder;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->folderConstructorLI:Ljava/lang/reflect/Constructor;

    if-eqz v4, :cond_18

    .line 1750
    const/4 v4, 0x2

    :try_start_6
    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p0, v3, v4

    .line 1751
    .local v3, "o":[Ljava/lang/Object;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->folderConstructorLI:Ljava/lang/reflect/Constructor;

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    move-object v2, v0
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_18} :catch_20

    .line 1757
    .end local v3    # "o":[Ljava/lang/Object;
    :cond_18
    :goto_18
    if-nez v2, :cond_1f

    .line 1758
    new-instance v2, Lcom/sun/mail/imap/IMAPFolder;

    .end local v2    # "f":Lcom/sun/mail/imap/IMAPFolder;
    invoke-direct {v2, p1, p0}, Lcom/sun/mail/imap/IMAPFolder;-><init>(Lcom/sun/mail/imap/protocol/ListInfo;Lcom/sun/mail/imap/IMAPStore;)V

    .line 1759
    .restart local v2    # "f":Lcom/sun/mail/imap/IMAPFolder;
    :cond_1f
    return-object v2

    .line 1752
    :catch_20
    move-exception v1

    .line 1753
    .local v1, "ex":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "exception creating IMAPFolder class LI"

    invoke-virtual {v4, v5, v6, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_18
.end method

.method protected newIMAPFolder(Ljava/lang/String;C)Lcom/sun/mail/imap/IMAPFolder;
    .registers 4
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "separator"    # C

    .prologue
    .line 1736
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/sun/mail/imap/IMAPStore;->newIMAPFolder(Ljava/lang/String;CLjava/lang/Boolean;)Lcom/sun/mail/imap/IMAPFolder;

    move-result-object v0

    return-object v0
.end method

.method protected newIMAPFolder(Ljava/lang/String;CLjava/lang/Boolean;)Lcom/sun/mail/imap/IMAPFolder;
    .registers 11
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "separator"    # C
    .param p3, "isNamespace"    # Ljava/lang/Boolean;

    .prologue
    .line 1711
    const/4 v2, 0x0

    .line 1712
    .local v2, "f":Lcom/sun/mail/imap/IMAPFolder;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->folderConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v4, :cond_22

    .line 1714
    const/4 v4, 0x4

    :try_start_6
    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    .line 1715
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p0, v3, v4

    const/4 v4, 0x3

    aput-object p3, v3, v4

    .line 1716
    .local v3, "o":[Ljava/lang/Object;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->folderConstructor:Ljava/lang/reflect/Constructor;

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    move-object v2, v0
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_22} :catch_2a

    .line 1722
    .end local v3    # "o":[Ljava/lang/Object;
    :cond_22
    :goto_22
    if-nez v2, :cond_29

    .line 1723
    new-instance v2, Lcom/sun/mail/imap/IMAPFolder;

    .end local v2    # "f":Lcom/sun/mail/imap/IMAPFolder;
    invoke-direct {v2, p1, p2, p0, p3}, Lcom/sun/mail/imap/IMAPFolder;-><init>(Ljava/lang/String;CLcom/sun/mail/imap/IMAPStore;Ljava/lang/Boolean;)V

    .line 1724
    .restart local v2    # "f":Lcom/sun/mail/imap/IMAPFolder;
    :cond_29
    return-object v2

    .line 1717
    :catch_2a
    move-exception v1

    .line 1718
    .local v1, "ex":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v6, "exception creating IMAPFolder class"

    invoke-virtual {v4, v5, v6, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_22
.end method

.method protected newIMAPProtocol(Ljava/lang/String;I)Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .registers 10
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 747
    new-instance v0, Lcom/sun/mail/imap/protocol/IMAPProtocol;

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/imap/IMAPStore;->session:Lkorex/mail/Session;

    .line 748
    invoke-virtual {v2}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v4

    iget-boolean v5, p0, Lcom/sun/mail/imap/IMAPStore;->isSSL:Z

    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    move-object v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/util/Properties;ZLcom/sun/mail/util/MailLogger;)V

    return-object v0
.end method

.method protected preLogin(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    .registers 2
    .param p1, "p"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 856
    return-void
.end method

.method protected declared-synchronized protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 15
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "pport"    # I
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 655
    monitor-enter p0

    const/4 v4, 0x0

    .line 658
    .local v4, "protocol":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    if-eqz p1, :cond_9

    if-eqz p4, :cond_9

    if-nez p3, :cond_4a

    .line 659
    :cond_9
    :try_start_9
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_47

    .line 660
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "protocolConnect returning false, host="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", user="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 662
    invoke-direct {p0, p3}, Lcom/sun/mail/imap/IMAPStore;->traceUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", password="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 663
    invoke-direct {p0, p4}, Lcom/sun/mail/imap/IMAPStore;->tracePassword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 660
    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_47
    .catchall {:try_start_9 .. :try_end_47} :catchall_137

    .line 664
    :cond_47
    const/4 v6, 0x0

    .line 730
    :goto_48
    monitor-exit p0

    return v6

    .line 668
    :cond_4a
    if-eq p2, v9, :cond_110

    .line 669
    :try_start_4c
    iput p2, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    .line 676
    :goto_4e
    iget v6, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    if-ne v6, v9, :cond_56

    .line 677
    iget v6, p0, Lcom/sun/mail/imap/IMAPStore;->defaultPort:I

    iput v6, p0, Lcom/sun/mail/imap/IMAPStore;->port:I
    :try_end_56
    .catchall {:try_start_4c .. :try_end_56} :catchall_137

    .line 682
    :cond_56
    :try_start_56
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v7
    :try_end_59
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_56 .. :try_end_59} :catch_13d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_56 .. :try_end_59} :catch_155
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_56 .. :try_end_59} :catch_166
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_16d
    .catchall {:try_start_56 .. :try_end_59} :catchall_137

    .line 683
    :try_start_59
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Vector;->isEmpty()Z

    move-result v3

    .line 684
    .local v3, "poolEmpty":Z
    monitor-exit v7
    :try_end_64
    .catchall {:try_start_59 .. :try_end_64} :catchall_13a

    .line 686
    if-eqz v3, :cond_10d

    .line 687
    :try_start_66
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_a0

    .line 688
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "trying to connect to host \""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\", port "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", isSSL "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/sun/mail/imap/IMAPStore;->isSSL:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 690
    :cond_a0
    iget v6, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    invoke-virtual {p0, p1, v6}, Lcom/sun/mail/imap/IMAPStore;->newIMAPProtocol(Ljava/lang/String;I)Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v4

    .line 691
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_e4

    .line 692
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "protocolConnect login, host="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", user="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 694
    invoke-direct {p0, p3}, Lcom/sun/mail/imap/IMAPStore;->traceUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", password="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 695
    invoke-direct {p0, p4}, Lcom/sun/mail/imap/IMAPStore;->tracePassword(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 692
    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 696
    :cond_e4
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 697
    invoke-direct {p0, v4, p3, p4}, Lcom/sun/mail/imap/IMAPStore;->login(Lcom/sun/mail/imap/protocol/IMAPProtocol;Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {v4, v6}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 699
    invoke-virtual {v4, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 701
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->isSSL()Z

    move-result v6

    iput-boolean v6, p0, Lcom/sun/mail/imap/IMAPStore;->usingSSL:Z

    .line 703
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore;->host:Ljava/lang/String;

    .line 704
    iput-object p3, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;

    .line 705
    iput-object p4, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;

    .line 707
    iget-object v7, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v7
    :try_end_103
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_66 .. :try_end_103} :catch_13d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_66 .. :try_end_103} :catch_155
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_66 .. :try_end_103} :catch_166
    .catch Ljava/io/IOException; {:try_start_66 .. :try_end_103} :catch_16d
    .catchall {:try_start_66 .. :try_end_103} :catchall_137

    .line 708
    :try_start_103
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v6}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 709
    monitor-exit v7
    :try_end_10d
    .catchall {:try_start_103 .. :try_end_10d} :catchall_152

    .line 730
    :cond_10d
    const/4 v6, 0x1

    goto/16 :goto_48

    .line 671
    .end local v3    # "poolEmpty":Z
    :cond_110
    :try_start_110
    iget-object v6, p0, Lcom/sun/mail/imap/IMAPStore;->session:Lkorex/mail/Session;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mail."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/sun/mail/imap/IMAPStore;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".port"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, p0, Lcom/sun/mail/imap/IMAPStore;->port:I

    invoke-static {v6, v7, v8}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/sun/mail/imap/IMAPStore;->port:I
    :try_end_135
    .catchall {:try_start_110 .. :try_end_135} :catchall_137

    goto/16 :goto_4e

    .line 655
    :catchall_137
    move-exception v6

    monitor-exit p0

    throw v6

    .line 684
    :catchall_13a
    move-exception v6

    :try_start_13b
    monitor-exit v7
    :try_end_13c
    .catchall {:try_start_13b .. :try_end_13c} :catchall_13a

    :try_start_13c
    throw v6
    :try_end_13d
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_13c .. :try_end_13d} :catch_13d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_13c .. :try_end_13d} :catch_155
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_13c .. :try_end_13d} :catch_166
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_13d} :catch_16d
    .catchall {:try_start_13c .. :try_end_13d} :catchall_137

    .line 711
    :catch_13d
    move-exception v0

    .line 713
    .local v0, "cex":Lcom/sun/mail/iap/CommandFailedException;
    if-eqz v4, :cond_143

    .line 714
    :try_start_140
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 715
    :cond_143
    const/4 v4, 0x0

    .line 716
    new-instance v6, Lkorex/mail/AuthenticationFailedException;

    .line 717
    invoke-virtual {v0}, Lcom/sun/mail/iap/CommandFailedException;->getResponse()Lcom/sun/mail/iap/Response;

    move-result-object v7

    invoke-virtual {v7}, Lcom/sun/mail/iap/Response;->getRest()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_152
    .catchall {:try_start_140 .. :try_end_152} :catchall_137

    .line 709
    .end local v0    # "cex":Lcom/sun/mail/iap/CommandFailedException;
    .restart local v3    # "poolEmpty":Z
    :catchall_152
    move-exception v6

    :try_start_153
    monitor-exit v7
    :try_end_154
    .catchall {:try_start_153 .. :try_end_154} :catchall_152

    :try_start_154
    throw v6
    :try_end_155
    .catch Lcom/sun/mail/iap/CommandFailedException; {:try_start_154 .. :try_end_155} :catch_13d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_154 .. :try_end_155} :catch_155
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_154 .. :try_end_155} :catch_166
    .catch Ljava/io/IOException; {:try_start_154 .. :try_end_155} :catch_16d
    .catchall {:try_start_154 .. :try_end_155} :catchall_137

    .line 718
    .end local v3    # "poolEmpty":Z
    :catch_155
    move-exception v2

    .line 720
    .local v2, "pex":Lcom/sun/mail/iap/ProtocolException;
    if-eqz v4, :cond_15b

    .line 721
    :try_start_158
    invoke-virtual {v4}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->disconnect()V

    .line 722
    :cond_15b
    const/4 v4, 0x0

    .line 723
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v2}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 724
    .end local v2    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catch_166
    move-exception v5

    .line 725
    .local v5, "scex":Lcom/sun/mail/util/SocketConnectException;
    new-instance v6, Lcom/sun/mail/util/MailConnectException;

    invoke-direct {v6, v5}, Lcom/sun/mail/util/MailConnectException;-><init>(Lcom/sun/mail/util/SocketConnectException;)V

    throw v6

    .line 726
    .end local v5    # "scex":Lcom/sun/mail/util/SocketConnectException;
    :catch_16d
    move-exception v1

    .line 727
    .local v1, "ioex":Ljava/io/IOException;
    new-instance v6, Lkorex/mail/MessagingException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
    :try_end_178
    .catchall {:try_start_158 .. :try_end_178} :catchall_137
.end method

.method releaseFolderStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    .registers 5
    .param p1, "protocol"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .prologue
    .line 1283
    if-nez p1, :cond_3

    .line 1295
    :goto_2
    return-void

    .line 1285
    :cond_3
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->nonStoreResponseHandler:Lcom/sun/mail/iap/ResponseHandler;

    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1286
    invoke-virtual {p1, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1287
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v1

    .line 1288
    :try_start_e
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    const/4 v2, 0x0

    # setter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->storeConnectionInUse:Z
    invoke-static {v0, v2}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$202(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;Z)Z

    .line 1289
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1291
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->logger:Lcom/sun/mail/util/MailLogger;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$500(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    const-string v2, "releaseFolderStoreProtocol()"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1293
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->timeoutConnections()V

    .line 1294
    monitor-exit v1

    goto :goto_2

    :catchall_29
    move-exception v0

    monitor-exit v1
    :try_end_2b
    .catchall {:try_start_e .. :try_end_2b} :catchall_29

    throw v0
.end method

.method releaseProtocol(Lcom/sun/mail/imap/IMAPFolder;Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    .registers 7
    .param p1, "folder"    # Lcom/sun/mail/imap/IMAPFolder;
    .param p2, "protocol"    # Lcom/sun/mail/imap/protocol/IMAPProtocol;

    .prologue
    .line 1208
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    monitor-enter v1

    .line 1209
    if-eqz p2, :cond_43

    .line 1212
    :try_start_5
    invoke-virtual {p0}, Lcom/sun/mail/imap/IMAPStore;->isConnectionPoolFull()Z

    move-result v0

    if-nez v0, :cond_59

    .line 1213
    invoke-virtual {p2, p0}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V

    .line 1214
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1216
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 1217
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "added an Authenticated connection -- size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    .line 1219
    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->authenticatedConnections:Ljava/util/Vector;
    invoke-static {v3}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$000(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1217
    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1229
    :cond_43
    :goto_43
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v0

    if-eqz v0, :cond_54

    .line 1230
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->pool:Lcom/sun/mail/imap/IMAPStore$ConnectionPool;

    # getter for: Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->folders:Ljava/util/Vector;
    invoke-static {v0}, Lcom/sun/mail/imap/IMAPStore$ConnectionPool;->access$400(Lcom/sun/mail/imap/IMAPStore$ConnectionPool;)Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 1232
    :cond_54
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->timeoutConnections()V

    .line 1233
    monitor-exit v1

    .line 1234
    return-void

    .line 1221
    :cond_59
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPStore;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "pool is full, not adding an Authenticated connection"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_60
    .catchall {:try_start_5 .. :try_end_60} :catchall_66

    .line 1224
    :try_start_60
    invoke-virtual {p2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->logout()V
    :try_end_63
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_60 .. :try_end_63} :catch_64
    .catchall {:try_start_60 .. :try_end_63} :catchall_66

    goto :goto_43

    .line 1225
    :catch_64
    move-exception v0

    goto :goto_43

    .line 1233
    :catchall_66
    move-exception v0

    :try_start_67
    monitor-exit v1
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_66

    throw v0
.end method

.method public declared-synchronized setPassword(Ljava/lang/String;)V
    .registers 3
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 900
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore;->password:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 901
    monitor-exit p0

    return-void

    .line 900
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setProxyAuthUser(Ljava/lang/String;)V
    .registers 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 1462
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore;->proxyAuthUser:Ljava/lang/String;

    .line 1463
    return-void
.end method

.method public declared-synchronized setQuota(Lkorex/mail/Quota;)V
    .registers 8
    .param p1, "quota"    # Lkorex/mail/Quota;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1885
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->checkConnected()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_1f

    .line 1886
    const/4 v2, 0x0

    .line 1888
    .local v2, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :try_start_5
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPStore;->getStoreProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    .line 1889
    invoke-virtual {v2, p1}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->setQuota(Lkorex/mail/Quota;)V
    :try_end_c
    .catch Lcom/sun/mail/iap/BadCommandException; {:try_start_5 .. :try_end_c} :catch_11
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_5 .. :try_end_c} :catch_22
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_5 .. :try_end_c} :catch_2d
    .catchall {:try_start_5 .. :try_end_c} :catchall_1a

    .line 1897
    :try_start_c
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_1f

    .line 1899
    monitor-exit p0

    return-void

    .line 1890
    :catch_11
    move-exception v0

    .line 1891
    .local v0, "bex":Lcom/sun/mail/iap/BadCommandException;
    :try_start_12
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "QUOTA not supported"

    invoke-direct {v4, v5, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_1a
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1a

    .line 1897
    .end local v0    # "bex":Lcom/sun/mail/iap/BadCommandException;
    :catchall_1a
    move-exception v4

    :try_start_1b
    invoke-direct {p0, v2}, Lcom/sun/mail/imap/IMAPStore;->releaseStoreProtocol(Lcom/sun/mail/imap/protocol/IMAPProtocol;)V

    throw v4
    :try_end_1f
    .catchall {:try_start_1b .. :try_end_1f} :catchall_1f

    .line 1885
    .end local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catchall_1f
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1892
    .restart local v2    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_22
    move-exception v1

    .line 1893
    .local v1, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_23
    new-instance v4, Lkorex/mail/StoreClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    throw v4

    .line 1894
    .end local v1    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catch_2d
    move-exception v3

    .line 1895
    .local v3, "pex":Lcom/sun/mail/iap/ProtocolException;
    new-instance v4, Lkorex/mail/MessagingException;

    invoke-virtual {v3}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
    :try_end_38
    .catchall {:try_start_23 .. :try_end_38} :catchall_1a
.end method

.method public declared-synchronized setUsername(Ljava/lang/String;)V
    .registers 3
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 885
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPStore;->user:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 886
    monitor-exit p0

    return-void

    .line 885
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method throwSearchException()Z
    .registers 2

    .prologue
    .line 1420
    iget-boolean v0, p0, Lcom/sun/mail/imap/IMAPStore;->throwSearchException:Z

    return v0
.end method
