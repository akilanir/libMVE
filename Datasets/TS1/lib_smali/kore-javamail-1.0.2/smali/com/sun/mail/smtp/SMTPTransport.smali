.class public Lcom/sun/mail/smtp/SMTPTransport;
.super Lkorex/mail/Transport;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;,
        Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;,
        Lcom/sun/mail/smtp/SMTPTransport$PlainAuthenticator;,
        Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;,
        Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CRLF:[B

.field private static final UNKNOWN:Ljava/lang/String; = "UNKNOWN"

.field private static final UNKNOWN_SA:[Ljava/lang/String;

.field private static hexchar:[C

.field private static final ignoreList:[Ljava/lang/String;


# instance fields
.field private addresses:[Lkorex/mail/Address;

.field private authenticators:Ljava/util/Map;

.field private authorizationID:Ljava/lang/String;

.field private dataStream:Lcom/sun/mail/smtp/SMTPOutputStream;

.field private defaultAuthenticationMechanisms:Ljava/lang/String;

.field private defaultPort:I

.field private enableSASL:Z

.field private exception:Lkorex/mail/MessagingException;

.field private extMap:Ljava/util/Hashtable;

.field private host:Ljava/lang/String;

.field private invalidAddr:[Lkorex/mail/Address;

.field private isSSL:Z

.field private lastReturnCode:I

.field private lastServerResponse:Ljava/lang/String;

.field private lineInputStream:Lcom/sun/mail/util/LineInputStream;

.field private localHostName:Ljava/lang/String;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private message:Lkorex/mail/internet/MimeMessage;

.field private name:Ljava/lang/String;

.field private noauthdebug:Z

.field private noopStrict:Z

.field private notificationDone:Z

.field private ntlmDomain:Ljava/lang/String;

.field private quitWait:Z

.field private reportSuccess:Z

.field private requireStartTLS:Z

.field private saslAuthenticator:Lcom/sun/mail/smtp/SaslAuthenticator;

.field private saslMechanisms:[Ljava/lang/String;

.field private saslRealm:Ljava/lang/String;

.field private sendPartiallyFailed:Z

.field private serverInput:Ljava/io/BufferedInputStream;

.field private serverOutput:Ljava/io/OutputStream;

.field private serverSocket:Ljava/net/Socket;

.field private traceInput:Lcom/sun/mail/util/TraceInputStream;

.field private traceLogger:Lcom/sun/mail/util/MailLogger;

.field private traceOutput:Lcom/sun/mail/util/TraceOutputStream;

.field private useCanonicalHostName:Z

.field private useRset:Z

.field private useStartTLS:Z

.field private validSentAddr:[Lkorex/mail/Address;

.field private validUnsentAddr:[Lkorex/mail/Address;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 90
    const-class v0, Lcom/sun/mail/smtp/SMTPTransport;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_2f

    move v0, v1

    :goto_c
    sput-boolean v0, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    .line 143
    new-array v0, v4, [Ljava/lang/String;

    const-string v3, "Bcc"

    aput-object v3, v0, v2

    const-string v3, "Content-Length"

    aput-object v3, v0, v1

    sput-object v0, Lcom/sun/mail/smtp/SMTPTransport;->ignoreList:[Ljava/lang/String;

    .line 144
    new-array v0, v4, [B

    fill-array-data v0, :array_32

    sput-object v0, Lcom/sun/mail/smtp/SMTPTransport;->CRLF:[B

    .line 146
    new-array v0, v2, [Ljava/lang/String;

    sput-object v0, Lcom/sun/mail/smtp/SMTPTransport;->UNKNOWN_SA:[Ljava/lang/String;

    .line 2433
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_38

    sput-object v0, Lcom/sun/mail/smtp/SMTPTransport;->hexchar:[C

    return-void

    :cond_2f
    move v0, v2

    .line 90
    goto :goto_c

    .line 144
    nop

    :array_32
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 2433
    nop

    :array_38
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;

    .prologue
    .line 156
    const-string v0, "smtp"

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V

    .line 157
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Session;Lkorex/mail/URLName;Ljava/lang/String;Z)V
    .registers 14
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "urlname"    # Lkorex/mail/URLName;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "isSSL"    # Z

    .prologue
    const/16 v8, 0x19

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 169
    invoke-direct {p0, p1, p2}, Lkorex/mail/Transport;-><init>(Lkorex/mail/Session;Lkorex/mail/URLName;)V

    .line 92
    const-string v3, "smtp"

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    .line 93
    iput v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultPort:I

    .line 94
    iput-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->isSSL:Z

    .line 103
    iput-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->sendPartiallyFailed:Z

    .line 112
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->authenticators:Ljava/util/Map;

    .line 115
    iput-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->quitWait:Z

    .line 117
    const-string v3, "UNKNOWN"

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;

    .line 118
    const-string v3, "UNKNOWN"

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->authorizationID:Ljava/lang/String;

    .line 119
    iput-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z

    .line 120
    iput-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z

    .line 121
    sget-object v3, Lcom/sun/mail/smtp/SMTPTransport;->UNKNOWN_SA:[Ljava/lang/String;

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;

    .line 123
    const-string v3, "UNKNOWN"

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->ntlmDomain:Ljava/lang/String;

    .line 129
    iput-boolean v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->noopStrict:Z

    .line 140
    iput-boolean v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z

    .line 170
    new-instance v3, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "DEBUG SMTP"

    invoke-direct {v3, v6, v7, p1}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;Lkorex/mail/Session;)V

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    .line 171
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "protocol"

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    .line 172
    const-string v3, "mail.debug.auth"

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_1db

    move v3, v4

    :goto_53
    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z

    .line 174
    if-eqz p2, :cond_5b

    .line 175
    invoke-virtual {p2}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object p3

    .line 176
    :cond_5b
    iput-object p3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    .line 177
    if-nez p4, :cond_7c

    .line 178
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".ssl.enable"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result p4

    .line 180
    :cond_7c
    if-eqz p4, :cond_1de

    .line 181
    const/16 v3, 0x1d1

    iput v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultPort:I

    .line 184
    :goto_82
    iput-boolean p4, p0, Lcom/sun/mail/smtp/SMTPTransport;->isSSL:Z

    .line 188
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".quitwait"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->quitWait:Z

    .line 192
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".reportsuccess"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->reportSuccess:Z

    .line 196
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".starttls.enable"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->useStartTLS:Z

    .line 200
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".starttls.required"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->requireStartTLS:Z

    .line 205
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".userset"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->useRset:Z

    .line 209
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".noop.strict"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v4}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->noopStrict:Z

    .line 213
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".sasl.enable"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z

    .line 215
    iget-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z

    if-eqz v3, :cond_168

    .line 216
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "enable SASL"

    invoke-virtual {v3, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 217
    :cond_168
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ".sasl.usecanonicalhostname"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z

    .line 219
    iget-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z

    if-eqz v3, :cond_192

    .line 220
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "use canonical host name"

    invoke-virtual {v3, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 223
    :cond_192
    const/4 v3, 0x4

    new-array v0, v3, [Lcom/sun/mail/smtp/SMTPTransport$Authenticator;

    new-instance v3, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;

    invoke-direct {v3, p0}, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;)V

    aput-object v3, v0, v5

    new-instance v3, Lcom/sun/mail/smtp/SMTPTransport$PlainAuthenticator;

    invoke-direct {v3, p0}, Lcom/sun/mail/smtp/SMTPTransport$PlainAuthenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;)V

    aput-object v3, v0, v4

    const/4 v3, 0x2

    new-instance v4, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;

    invoke-direct {v4, p0}, Lcom/sun/mail/smtp/SMTPTransport$DigestMD5Authenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;)V

    aput-object v4, v0, v3

    const/4 v3, 0x3

    new-instance v4, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;

    invoke-direct {v4, p0}, Lcom/sun/mail/smtp/SMTPTransport$NtlmAuthenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;)V

    aput-object v4, v0, v3

    .line 229
    .local v0, "a":[Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 230
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b9
    array-length v3, v0

    if-ge v1, v3, :cond_1e2

    .line 231
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->authenticators:Ljava/util/Map;

    aget-object v4, v0, v1

    invoke-virtual {v4}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->getMechanism()Ljava/lang/String;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    aget-object v3, v0, v1

    invoke-virtual {v3}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->getMechanism()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 230
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b9

    .end local v0    # "a":[Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    .end local v1    # "i":I
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    :cond_1db
    move v3, v5

    .line 172
    goto/16 :goto_53

    .line 183
    :cond_1de
    iput v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultPort:I

    goto/16 :goto_82

    .line 234
    .restart local v0    # "a":[Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    .restart local v1    # "i":I
    .restart local v2    # "sb":Ljava/lang/StringBuffer;
    :cond_1e2
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultAuthenticationMechanisms:Ljava/lang/String;

    .line 235
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/smtp/SMTPTransport;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z

    return v0
.end method

.method static synthetic access$100(Lcom/sun/mail/smtp/SMTPTransport;)Z
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/sun/mail/smtp/SMTPTransport;)Lcom/sun/mail/util/MailLogger;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    return-object v0
.end method

.method static synthetic access$300(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 1
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->suspendTracing()V

    return-void
.end method

.method static synthetic access$400(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 1
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V

    return-void
.end method

.method static synthetic access$500(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 1
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V

    return-void
.end method

.method static synthetic access$600(Lcom/sun/mail/smtp/SMTPTransport;)Lkorex/mail/Session;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    return-object v0
.end method

.method static synthetic access$700(Lcom/sun/mail/smtp/SMTPTransport;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/smtp/SMTPTransport;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    return-object v0
.end method

.method private addressesFailed()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1263
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    if-eqz v1, :cond_2a

    .line 1264
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    if-eqz v1, :cond_2b

    .line 1265
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v1, v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    array-length v2, v2

    add-int/2addr v1, v2

    new-array v0, v1, [Lkorex/mail/Address;

    .line 1267
    .local v0, "newa":[Lkorex/mail/Address;
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v2, v2

    invoke-static {v1, v4, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1269
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v2, v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    array-length v3, v3

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1271
    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 1272
    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 1278
    .end local v0    # "newa":[Lkorex/mail/Address;
    :cond_2a
    :goto_2a
    return-void

    .line 1274
    :cond_2b
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 1275
    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    goto :goto_2a
.end method

.method private authenticate(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 16
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 758
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".auth.mechanisms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 759
    .local v11, "mechs":Ljava/lang/String;
    if-nez v11, :cond_25

    .line 760
    iget-object v11, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultAuthenticationMechanisms:Ljava/lang/String;

    .line 762
    :cond_25
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getAuthorizationId()Ljava/lang/String;

    move-result-object v3

    .line 763
    .local v3, "authzid":Ljava/lang/String;
    if-nez v3, :cond_2c

    .line 764
    move-object v3, p1

    .line 765
    :cond_2c
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z

    if-eqz v0, :cond_5d

    .line 766
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "Authenticate with SASL"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 768
    :try_start_37
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getSASLMechanisms()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getSASLRealm()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/smtp/SMTPTransport;->sasllogin([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 770
    const/4 v0, 0x1

    .line 815
    :goto_49
    return v0

    .line 772
    :cond_4a
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "SASL authentication failed"

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_51
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_37 .. :try_end_51} :catch_53

    .line 773
    const/4 v0, 0x0

    goto :goto_49

    .line 775
    :catch_53
    move-exception v9

    .line 776
    .local v9, "ex":Ljava/lang/UnsupportedOperationException;
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "SASL support failed"

    invoke-virtual {v0, v1, v2, v9}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 781
    .end local v9    # "ex":Ljava/lang/UnsupportedOperationException;
    :cond_5d
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 782
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempt to authenticate using mechanisms: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 790
    :cond_7f
    new-instance v12, Ljava/util/StringTokenizer;

    invoke-direct {v12, v11}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 791
    .local v12, "st":Ljava/util/StringTokenizer;
    :cond_84
    :goto_84
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_122

    .line 792
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v10

    .line 793
    .local v10, "m":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mail."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".auth."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 794
    invoke-virtual {v10, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".disable"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 795
    .local v8, "dprop":Ljava/lang/String;
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    const/4 v1, 0x0

    .line 796
    invoke-static {v0, v8, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v7

    .line 797
    .local v7, "disabled":Z
    if-eqz v7, :cond_ef

    .line 798
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_84

    .line 799
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mechanism "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " disabled by property: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_84

    .line 803
    :cond_ef
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v10, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    .line 804
    invoke-virtual {p0, v10}, Lcom/sun/mail/smtp/SMTPTransport;->supportsAuthentication(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_105

    .line 805
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "mechanism {0} not supported by server"

    invoke-virtual {v0, v1, v2, v10}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_84

    .line 809
    :cond_105
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->authenticators:Ljava/util/Map;

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;

    .line 810
    .local v6, "a":Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    if-nez v6, :cond_11a

    .line 811
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v2, "no authenticator for mechanism {0}"

    invoke-virtual {v0, v1, v2, v10}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_84

    .line 815
    :cond_11a
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v6, v0, v3, p1, p2}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto/16 :goto_49

    .line 819
    .end local v6    # "a":Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
    .end local v7    # "disabled":Z
    .end local v8    # "dprop":Ljava/lang/String;
    .end local v10    # "m":Ljava/lang/String;
    :cond_122
    new-instance v0, Lkorex/mail/AuthenticationFailedException;

    const-string v1, "No authentication mechanisms supported by both server and client"

    invoke-direct {v0, v1}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private closeConnection()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1303
    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v1, :cond_a

    .line 1304
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a} :catch_1c
    .catchall {:try_start_1 .. :try_end_a} :catchall_25

    .line 1308
    :cond_a
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 1309
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    .line 1310
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    .line 1311
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    .line 1312
    invoke-super {p0}, Lkorex/mail/Transport;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 1313
    invoke-super {p0}, Lkorex/mail/Transport;->close()V

    .line 1315
    :cond_1b
    return-void

    .line 1305
    :catch_1c
    move-exception v0

    .line 1306
    .local v0, "ioex":Ljava/io/IOException;
    :try_start_1d
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Server Close Failed"

    invoke-direct {v1, v2, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
    :try_end_25
    .catchall {:try_start_1d .. :try_end_25} :catchall_25

    .line 1308
    .end local v0    # "ioex":Ljava/io/IOException;
    :catchall_25
    move-exception v1

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 1309
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    .line 1310
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    .line 1311
    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    .line 1312
    invoke-super {p0}, Lkorex/mail/Transport;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_37

    .line 1313
    invoke-super {p0}, Lkorex/mail/Transport;->close()V

    :cond_37
    throw v1
.end method

.method private convertTo8Bit(Lkorex/mail/internet/MimePart;)Z
    .registers 10
    .param p1, "part"    # Lkorex/mail/internet/MimePart;

    .prologue
    .line 1441
    const/4 v0, 0x0

    .line 1443
    .local v0, "changed":Z
    :try_start_1
    const-string v6, "text/*"

    invoke-interface {p1, v6}, Lkorex/mail/internet/MimePart;->isMimeType(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4c

    .line 1444
    invoke-interface {p1}, Lkorex/mail/internet/MimePart;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 1445
    .local v2, "enc":Ljava/lang/String;
    if-eqz v2, :cond_42

    const-string v6, "quoted-printable"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1f

    const-string v6, "base64"

    .line 1446
    invoke-virtual {v2, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1c} :catch_4a
    .catch Lkorex/mail/MessagingException; {:try_start_1 .. :try_end_1c} :catch_75

    move-result v6

    if-eqz v6, :cond_42

    .line 1447
    :cond_1f
    const/4 v4, 0x0

    .line 1449
    .local v4, "is":Ljava/io/InputStream;
    :try_start_20
    invoke-interface {p1}, Lkorex/mail/internet/MimePart;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 1450
    invoke-direct {p0, v4}, Lcom/sun/mail/smtp/SMTPTransport;->is8Bit(Ljava/io/InputStream;)Z

    move-result v6

    if-eqz v6, :cond_3d

    .line 1460
    invoke-interface {p1}, Lkorex/mail/internet/MimePart;->getContent()Ljava/lang/Object;

    move-result-object v6

    .line 1461
    invoke-interface {p1}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;

    move-result-object v7

    .line 1460
    invoke-interface {p1, v6, v7}, Lkorex/mail/internet/MimePart;->setContent(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1462
    const-string v6, "Content-Transfer-Encoding"

    const-string v7, "8bit"

    invoke-interface {p1, v6, v7}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3c
    .catchall {:try_start_20 .. :try_end_3c} :catchall_43

    .line 1463
    const/4 v0, 0x1

    .line 1466
    :cond_3d
    if-eqz v4, :cond_42

    .line 1468
    :try_start_3f
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_42} :catch_71
    .catch Lkorex/mail/MessagingException; {:try_start_3f .. :try_end_42} :catch_75

    .line 1488
    .end local v2    # "enc":Ljava/lang/String;
    .end local v4    # "is":Ljava/io/InputStream;
    :cond_42
    :goto_42
    return v0

    .line 1466
    .restart local v2    # "enc":Ljava/lang/String;
    .restart local v4    # "is":Ljava/io/InputStream;
    :catchall_43
    move-exception v6

    if-eqz v4, :cond_49

    .line 1468
    :try_start_46
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_49} :catch_73
    .catch Lkorex/mail/MessagingException; {:try_start_46 .. :try_end_49} :catch_75

    .line 1471
    :cond_49
    :goto_49
    :try_start_49
    throw v6

    .line 1483
    .end local v2    # "enc":Ljava/lang/String;
    .end local v4    # "is":Ljava/io/InputStream;
    :catch_4a
    move-exception v6

    goto :goto_42

    .line 1475
    :cond_4c
    const-string v6, "multipart/*"

    invoke-interface {p1, v6}, Lkorex/mail/internet/MimePart;->isMimeType(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_42

    .line 1476
    invoke-interface {p1}, Lkorex/mail/internet/MimePart;->getContent()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkorex/mail/internet/MimeMultipart;

    .line 1477
    .local v5, "mp":Lkorex/mail/internet/MimeMultipart;
    invoke-virtual {v5}, Lkorex/mail/internet/MimeMultipart;->getCount()I

    move-result v1

    .line 1478
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5f
    if-ge v3, v1, :cond_42

    .line 1479
    invoke-virtual {v5, v3}, Lkorex/mail/internet/MimeMultipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v6

    check-cast v6, Lkorex/mail/internet/MimePart;

    invoke-direct {p0, v6}, Lcom/sun/mail/smtp/SMTPTransport;->convertTo8Bit(Lkorex/mail/internet/MimePart;)Z
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_6a} :catch_4a
    .catch Lkorex/mail/MessagingException; {:try_start_49 .. :try_end_6a} :catch_75

    move-result v6

    if-eqz v6, :cond_6e

    .line 1480
    const/4 v0, 0x1

    .line 1478
    :cond_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_5f

    .line 1469
    .end local v1    # "count":I
    .end local v3    # "i":I
    .end local v5    # "mp":Lkorex/mail/internet/MimeMultipart;
    .restart local v2    # "enc":Ljava/lang/String;
    .restart local v4    # "is":Ljava/io/InputStream;
    :catch_71
    move-exception v6

    goto :goto_42

    :catch_73
    move-exception v7

    goto :goto_49

    .line 1485
    .end local v2    # "enc":Ljava/lang/String;
    .end local v4    # "is":Ljava/io/InputStream;
    :catch_75
    move-exception v6

    goto :goto_42
.end method

.method private expandGroups()V
    .registers 10

    .prologue
    .line 1393
    const/4 v1, 0x0

    .line 1394
    .local v1, "groups":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    array-length v8, v8

    if-ge v2, v8, :cond_4b

    .line 1395
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    aget-object v0, v8, v2

    check-cast v0, Lkorex/mail/internet/InternetAddress;

    .line 1396
    .local v0, "a":Lkorex/mail/internet/InternetAddress;
    invoke-virtual {v0}, Lkorex/mail/internet/InternetAddress;->isGroup()Z

    move-result v8

    if-eqz v8, :cond_45

    .line 1397
    if-nez v1, :cond_27

    .line 1399
    new-instance v1, Ljava/util/Vector;

    .end local v1    # "groups":Ljava/util/Vector;
    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 1400
    .restart local v1    # "groups":Ljava/util/Vector;
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_1b
    if-ge v5, v2, :cond_27

    .line 1401
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    aget-object v8, v8, v5

    invoke-virtual {v1, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1400
    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    .line 1405
    .end local v5    # "k":I
    :cond_27
    const/4 v8, 0x1

    :try_start_28
    invoke-virtual {v0, v8}, Lkorex/mail/internet/InternetAddress;->getGroup(Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v3

    .line 1406
    .local v3, "ia":[Lkorex/mail/internet/InternetAddress;
    if-eqz v3, :cond_3a

    .line 1407
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2f
    array-length v8, v3

    if-ge v4, v8, :cond_3d

    .line 1408
    aget-object v8, v3, v4

    invoke-virtual {v1, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1407
    add-int/lit8 v4, v4, 0x1

    goto :goto_2f

    .line 1410
    .end local v4    # "j":I
    :cond_3a
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_3d
    .catch Lkorex/mail/internet/ParseException; {:try_start_28 .. :try_end_3d} :catch_40

    .line 1394
    .end local v3    # "ia":[Lkorex/mail/internet/InternetAddress;
    :cond_3d
    :goto_3d
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1411
    :catch_40
    move-exception v7

    .line 1413
    .local v7, "pex":Lkorex/mail/internet/ParseException;
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_3d

    .line 1417
    .end local v7    # "pex":Lkorex/mail/internet/ParseException;
    :cond_45
    if-eqz v1, :cond_3d

    .line 1418
    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_3d

    .line 1423
    .end local v0    # "a":Lkorex/mail/internet/InternetAddress;
    :cond_4b
    if-eqz v1, :cond_58

    .line 1424
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v8

    new-array v6, v8, [Lkorex/mail/internet/InternetAddress;

    .line 1425
    .local v6, "newa":[Lkorex/mail/internet/InternetAddress;
    invoke-virtual {v1, v6}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1426
    iput-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    .line 1428
    .end local v6    # "newa":[Lkorex/mail/internet/InternetAddress;
    :cond_58
    return-void
.end method

.method private initStreams()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2106
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    const-string v2, "mail.debug.quote"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v0

    .line 2109
    .local v0, "quote":Z
    new-instance v1, Lcom/sun/mail/util/TraceInputStream;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 2110
    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v1, v2, v3}, Lcom/sun/mail/util/TraceInputStream;-><init>(Ljava/io/InputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    .line 2111
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v1, v0}, Lcom/sun/mail/util/TraceInputStream;->setQuote(Z)V

    .line 2113
    new-instance v1, Lcom/sun/mail/util/TraceOutputStream;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 2114
    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v1, v2, v3}, Lcom/sun/mail/util/TraceOutputStream;-><init>(Ljava/io/OutputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    .line 2115
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v1, v0}, Lcom/sun/mail/util/TraceOutputStream;->setQuote(Z)V

    .line 2117
    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    .line 2119
    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    .line 2121
    new-instance v1, Lcom/sun/mail/util/LineInputStream;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    invoke-direct {v1, v2}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    .line 2122
    return-void
.end method

.method private is8Bit(Ljava/io/InputStream;)Z
    .registers 8
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x0

    .line 1500
    const/4 v2, 0x0

    .line 1501
    .local v2, "linelen":I
    const/4 v3, 0x0

    .line 1503
    .local v3, "need8bit":Z
    :cond_3
    :goto_3
    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6} :catch_26

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_29

    .line 1504
    and-int/lit16 v0, v0, 0xff

    .line 1505
    const/16 v5, 0xd

    if-eq v0, v5, :cond_13

    const/16 v5, 0xa

    if-ne v0, v5, :cond_1a

    .line 1506
    :cond_13
    const/4 v2, 0x0

    .line 1514
    :cond_14
    const/16 v5, 0x7f

    if-le v0, v5, :cond_3

    .line 1515
    const/4 v3, 0x1

    goto :goto_3

    .line 1507
    :cond_1a
    if-nez v0, :cond_1e

    move v3, v4

    .line 1522
    .end local v0    # "b":I
    .end local v3    # "need8bit":Z
    :cond_1d
    :goto_1d
    return v3

    .line 1510
    .restart local v0    # "b":I
    .restart local v3    # "need8bit":Z
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    .line 1511
    const/16 v5, 0x3e6

    if-le v2, v5, :cond_14

    move v3, v4

    .line 1512
    goto :goto_1d

    .line 1517
    .end local v0    # "b":I
    :catch_26
    move-exception v1

    .local v1, "ex":Ljava/io/IOException;
    move v3, v4

    .line 1518
    goto :goto_1d

    .line 1520
    .end local v1    # "ex":Ljava/io/IOException;
    .restart local v0    # "b":I
    :cond_29
    if-eqz v3, :cond_1d

    .line 1521
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "found an 8bit part"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    goto :goto_1d
.end method

.method private isNotLastLine(Ljava/lang/String;)Z
    .registers 4
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 2360
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_14

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private isTracing()Z
    .registers 3

    .prologue
    .line 2128
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method private issueSendCommand(Ljava/lang/String;I)V
    .registers 16
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "expect"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2177
    invoke-virtual {p0, p1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 2182
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v2

    .local v2, "ret":I
    if-eq v2, p2, :cond_84

    .line 2185
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    if-nez v1, :cond_7c

    move v11, v0

    .line 2186
    .local v11, "vsl":I
    :goto_f
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    if-nez v1, :cond_80

    move v12, v0

    .line 2187
    .local v12, "vul":I
    :goto_14
    add-int v1, v11, v12

    new-array v10, v1, [Lkorex/mail/Address;

    .line 2188
    .local v10, "valid":[Lkorex/mail/Address;
    if-lez v11, :cond_1f

    .line 2189
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    invoke-static {v1, v0, v10, v0, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2190
    :cond_1f
    if-lez v12, :cond_26

    .line 2191
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    invoke-static {v1, v0, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2192
    :cond_26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 2193
    iput-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 2194
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 2195
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "got response code "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", with response: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2197
    :cond_59
    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 2198
    .local v9, "_lsr":Ljava/lang/String;
    iget v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 2199
    .local v8, "_lrc":I
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v0, :cond_67

    .line 2200
    const-string v0, "RSET"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V

    .line 2201
    :cond_67
    iput-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 2202
    iput v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 2203
    new-instance v0, Lcom/sun/mail/smtp/SMTPSendFailedException;

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->exception:Lkorex/mail/MessagingException;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/sun/mail/smtp/SMTPSendFailedException;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V

    throw v0

    .line 2185
    .end local v8    # "_lrc":I
    .end local v9    # "_lsr":Ljava/lang/String;
    .end local v10    # "valid":[Lkorex/mail/Address;
    .end local v11    # "vsl":I
    .end local v12    # "vul":I
    :cond_7c
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v11, v1

    goto :goto_f

    .line 2186
    .restart local v11    # "vsl":I
    :cond_80
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    array-length v12, v1

    goto :goto_14

    .line 2206
    .end local v11    # "vsl":I
    :cond_84
    return-void
.end method

.method private normalizeAddress(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 2365
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 2366
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 2368
    .end local p1    # "addr":Ljava/lang/String;
    :cond_29
    return-object p1
.end method

.method private openServer()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2066
    const/4 v1, -0x1

    .line 2067
    .local v1, "port":I
    const-string v3, "UNKNOWN"

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    .line 2069
    :try_start_5
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getPort()I

    move-result v1

    .line 2070
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    .line 2071
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_45

    .line 2072
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "starting protocol to host \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\", port "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2075
    :cond_45
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->initStreams()V

    .line 2077
    const/4 v2, -0x1

    .line 2078
    .local v2, "r":I
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v2

    const/16 v3, 0xdc

    if-eq v2, v3, :cond_f5

    .line 2079
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->close()V

    .line 2080
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 2081
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    .line 2082
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    .line 2083
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    .line 2084
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_a0

    .line 2085
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "got bad greeting from host \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\", port: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2088
    :cond_a0
    new-instance v3, Lkorex/mail/MessagingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Got bad greeting from SMTP host: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", port: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_cf} :catch_cf

    .line 2097
    .end local v2    # "r":I
    :catch_cf
    move-exception v0

    .line 2098
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v3, Lkorex/mail/MessagingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not start protocol to SMTP host: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", port: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 2093
    .end local v0    # "ioe":Ljava/io/IOException;
    .restart local v2    # "r":I
    :cond_f5
    :try_start_f5
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_129

    .line 2094
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "protocol started to host \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\", port: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_129
    .catch Ljava/io/IOException; {:try_start_f5 .. :try_end_129} :catch_cf

    .line 2102
    :cond_129
    return-void
.end method

.method private openServer(Ljava/lang/String;I)V
    .registers 11
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2013
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 2014
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "trying to connect to host \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\", port "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", isSSL "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->isSSL:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2018
    :cond_38
    :try_start_38
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    invoke-virtual {v5}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v1

    .line 2020
    .local v1, "props":Ljava/util/Properties;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->isSSL:Z

    invoke-static {p1, p2, v1, v5, v6}, Lcom/sun/mail/util/SocketFetcher;->getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;Z)Ljava/net/Socket;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 2025
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->getPort()I

    move-result p2

    .line 2027
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    .line 2029
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->initStreams()V

    .line 2031
    const/4 v2, -0x1

    .line 2032
    .local v2, "r":I
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v2

    const/16 v5, 0xdc

    if-eq v2, v5, :cond_103

    .line 2033
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->close()V

    .line 2034
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 2035
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    .line 2036
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverInput:Ljava/io/BufferedInputStream;

    .line 2037
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    .line 2038
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_bc

    .line 2039
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "could not connect to host \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\", port: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 2042
    :cond_bc
    new-instance v5, Lkorex/mail/MessagingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not connect to SMTP host: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", port: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_e9
    .catch Ljava/net/UnknownHostException; {:try_start_38 .. :try_end_e9} :catch_e9
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_38 .. :try_end_e9} :catch_136
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_e9} :catch_13d

    .line 2051
    .end local v1    # "props":Ljava/util/Properties;
    .end local v2    # "r":I
    :catch_e9
    move-exception v4

    .line 2052
    .local v4, "uhex":Ljava/net/UnknownHostException;
    new-instance v5, Lkorex/mail/MessagingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown SMTP host: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 2047
    .end local v4    # "uhex":Ljava/net/UnknownHostException;
    .restart local v1    # "props":Ljava/util/Properties;
    .restart local v2    # "r":I
    :cond_103
    :try_start_103
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_135

    .line 2048
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "connected to host \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\", port: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_135
    .catch Ljava/net/UnknownHostException; {:try_start_103 .. :try_end_135} :catch_e9
    .catch Lcom/sun/mail/util/SocketConnectException; {:try_start_103 .. :try_end_135} :catch_136
    .catch Ljava/io/IOException; {:try_start_103 .. :try_end_135} :catch_13d

    .line 2059
    :cond_135
    return-void

    .line 2053
    .end local v1    # "props":Ljava/util/Properties;
    .end local v2    # "r":I
    :catch_136
    move-exception v3

    .line 2054
    .local v3, "scex":Lcom/sun/mail/util/SocketConnectException;
    new-instance v5, Lcom/sun/mail/util/MailConnectException;

    invoke-direct {v5, v3}, Lcom/sun/mail/util/MailConnectException;-><init>(Lcom/sun/mail/util/SocketConnectException;)V

    throw v5

    .line 2055
    .end local v3    # "scex":Lcom/sun/mail/util/SocketConnectException;
    :catch_13d
    move-exception v0

    .line 2056
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v5, Lkorex/mail/MessagingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Could not connect to SMTP host: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", port: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
.end method

.method private resumeTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 2146
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2147
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 2148
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 2150
    :cond_15
    return-void
.end method

.method private sendCommand([B)V
    .registers 5
    .param p1, "cmdBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2251
    sget-boolean v1, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2256
    :cond_10
    :try_start_10
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V

    .line 2257
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    sget-object v2, Lcom/sun/mail/smtp/SMTPTransport;->CRLF:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 2258
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_21} :catch_22

    .line 2262
    return-void

    .line 2259
    :catch_22
    move-exception v0

    .line 2260
    .local v0, "ex":Ljava/io/IOException;
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Can\'t send command to SMTP host"

    invoke-direct {v1, v2, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method private sendMessageEnd()V
    .registers 1

    .prologue
    .line 2485
    return-void
.end method

.method private sendMessageStart(Ljava/lang/String;)V
    .registers 2
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 2484
    return-void
.end method

.method private suspendTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 2136
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2137
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 2138
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 2140
    :cond_15
    return-void
.end method

.method protected static xtext(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2b

    .line 2459
    const/4 v2, 0x0

    .line 2460
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_6e

    .line 2461
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 2462
    .local v0, "c":C
    const/16 v3, 0x80

    if-lt v0, v3, :cond_2b

    .line 2463
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Non-ASCII character in SMTP submitter: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2465
    :cond_2b
    const/16 v3, 0x21

    if-lt v0, v3, :cond_39

    const/16 v3, 0x7e

    if-gt v0, v3, :cond_39

    if-eq v0, v5, :cond_39

    const/16 v3, 0x3d

    if-ne v0, v3, :cond_68

    .line 2466
    :cond_39
    if-nez v2, :cond_4e

    .line 2467
    new-instance v2, Ljava/lang/StringBuffer;

    .end local v2    # "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x4

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 2468
    .restart local v2    # "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2470
    :cond_4e
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2471
    sget-object v3, Lcom/sun/mail/smtp/SMTPTransport;->hexchar:[C

    and-int/lit16 v4, v0, 0xf0

    shr-int/lit8 v4, v4, 0x4

    aget-char v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2472
    sget-object v3, Lcom/sun/mail/smtp/SMTPTransport;->hexchar:[C

    and-int/lit8 v4, v0, 0xf

    aget-char v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2460
    :cond_65
    :goto_65
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 2474
    :cond_68
    if-eqz v2, :cond_65

    .line 2475
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_65

    .line 2478
    .end local v0    # "c":C
    :cond_6e
    if-eqz v2, :cond_74

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0    # "s":Ljava/lang/String;
    :cond_74
    return-object p0
.end method


# virtual methods
.method protected checkConnected()V
    .registers 3

    .prologue
    .line 2354
    invoke-super {p0}, Lkorex/mail/Transport;->isConnected()Z

    move-result v0

    if-nez v0, :cond_e

    .line 2355
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2356
    :cond_e
    return-void
.end method

.method public declared-synchronized close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1284
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Lkorex/mail/Transport;->isConnected()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_47

    move-result v1

    if-nez v1, :cond_9

    .line 1299
    :goto_7
    monitor-exit p0

    return-void

    .line 1287
    :cond_9
    :try_start_9
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v1, :cond_43

    .line 1288
    const-string v1, "QUIT"

    invoke-virtual {p0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 1289
    iget-boolean v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->quitWait:Z

    if-eqz v1, :cond_43

    .line 1290
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v0

    .line 1291
    .local v0, "resp":I
    const/16 v1, 0xdd

    if-eq v0, v1, :cond_43

    const/4 v1, -0x1

    if-eq v0, v1, :cond_43

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 1292
    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 1293
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "QUIT failed with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_43
    .catchall {:try_start_9 .. :try_end_43} :catchall_4a

    .line 1297
    .end local v0    # "resp":I
    :cond_43
    :try_start_43
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_46
    .catchall {:try_start_43 .. :try_end_46} :catchall_47

    goto :goto_7

    .line 1284
    :catchall_47
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1297
    :catchall_4a
    move-exception v1

    :try_start_4b
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V

    throw v1
    :try_end_4f
    .catchall {:try_start_4b .. :try_end_4f} :catchall_47
.end method

.method public declared-synchronized connect(Ljava/net/Socket;)V
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 299
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 300
    invoke-super {p0}, Lkorex/mail/Transport;->connect()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 301
    monitor-exit p0

    return-void

    .line 299
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected data()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1965
    sget-boolean v0, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1966
    :cond_10
    const-string v0, "DATA"

    const/16 v1, 0x162

    invoke-direct {p0, v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->issueSendCommand(Ljava/lang/String;I)V

    .line 1967
    new-instance v0, Lcom/sun/mail/smtp/SMTPOutputStream;

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverOutput:Ljava/io/OutputStream;

    invoke-direct {v0, v1}, Lcom/sun/mail/smtp/SMTPOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->dataStream:Lcom/sun/mail/smtp/SMTPOutputStream;

    .line 1968
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->dataStream:Lcom/sun/mail/smtp/SMTPOutputStream;

    return-object v0
.end method

.method protected ehlo(Ljava/lang/String;)Z
    .registers 14
    .param p1, "domain"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/16 v11, 0xfa

    const/4 v7, 0x0

    .line 1569
    if-eqz p1, :cond_3f

    .line 1570
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "EHLO "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1573
    .local v1, "cmd":Ljava/lang/String;
    :goto_18
    invoke-virtual {p0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 1574
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v6

    .line 1575
    .local v6, "resp":I
    if-ne v6, v11, :cond_a2

    .line 1577
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/StringReader;

    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1580
    .local v5, "rd":Ljava/io/BufferedReader;
    new-instance v8, Ljava/util/Hashtable;

    invoke-direct {v8}, Ljava/util/Hashtable;-><init>()V

    iput-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    .line 1582
    const/4 v2, 0x1

    .line 1583
    .local v2, "first":Z
    :cond_35
    :goto_35
    :try_start_35
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_a1

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_a2

    .line 1584
    if-eqz v2, :cond_42

    .line 1585
    const/4 v2, 0x0

    .line 1586
    goto :goto_35

    .line 1572
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v2    # "first":Z
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "rd":Ljava/io/BufferedReader;
    .end local v6    # "resp":I
    :cond_3f
    const-string v1, "EHLO"

    .restart local v1    # "cmd":Ljava/lang/String;
    goto :goto_18

    .line 1588
    .restart local v2    # "first":Z
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v5    # "rd":Ljava/io/BufferedReader;
    .restart local v6    # "resp":I
    :cond_42
    :try_start_42
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x5

    if-lt v8, v9, :cond_35

    .line 1590
    const/4 v8, 0x4

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 1591
    const/16 v8, 0x20

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 1592
    .local v3, "i":I
    const-string v0, ""

    .line 1593
    .local v0, "arg":Ljava/lang/String;
    if-lez v3, :cond_63

    .line 1594
    add-int/lit8 v8, v3, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1595
    const/4 v8, 0x0

    invoke-virtual {v4, v8, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 1597
    :cond_63
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v8, v9}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v8

    if-eqz v8, :cond_95

    .line 1598
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Found extension \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\", arg \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1600
    :cond_95
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    sget-object v9, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v9}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a0
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_a0} :catch_a1

    goto :goto_35

    .line 1602
    .end local v0    # "arg":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "line":Ljava/lang/String;
    :catch_a1
    move-exception v8

    .line 1604
    .end local v2    # "first":Z
    .end local v5    # "rd":Ljava/io/BufferedReader;
    :cond_a2
    if-ne v6, v11, :cond_a5

    const/4 v7, 0x1

    :cond_a5
    return v7
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1526
    invoke-super {p0}, Lkorex/mail/Transport;->finalize()V

    .line 1528
    :try_start_3
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_6
    .catch Lkorex/mail/MessagingException; {:try_start_3 .. :try_end_6} :catch_7

    .line 1532
    :goto_6
    return-void

    .line 1529
    :catch_7
    move-exception v0

    goto :goto_6
.end method

.method protected finishData()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1979
    sget-boolean v0, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1980
    :cond_10
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->dataStream:Lcom/sun/mail/smtp/SMTPOutputStream;

    invoke-virtual {v0}, Lcom/sun/mail/smtp/SMTPOutputStream;->ensureAtBOL()V

    .line 1981
    const-string v0, "."

    const/16 v1, 0xfa

    invoke-direct {p0, v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->issueSendCommand(Ljava/lang/String;I)V

    .line 1982
    return-void
.end method

.method public declared-synchronized getAuthorizationId()Ljava/lang/String;
    .registers 4

    .prologue
    .line 311
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->authorizationID:Ljava/lang/String;

    const-string v1, "UNKNOWN"

    if-ne v0, v1, :cond_2a

    .line 312
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".sasl.authorizationid"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 313
    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->authorizationID:Ljava/lang/String;

    .line 315
    :cond_2a
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->authorizationID:Ljava/lang/String;
    :try_end_2c
    .catchall {:try_start_1 .. :try_end_2c} :catchall_2e

    monitor-exit p0

    return-object v0

    .line 311
    :catchall_2e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getExtensionParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "ext"    # Ljava/lang/String;

    .prologue
    .line 2398
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    .line 2399
    :goto_5
    return-object v0

    .line 2398
    :cond_6
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2399
    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_5
.end method

.method public declared-synchronized getLastReturnCode()I
    .registers 2

    .prologue
    .line 631
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLastServerResponse()Ljava/lang/String;
    .registers 2

    .prologue
    .line 620
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLocalHost()Ljava/lang/String;
    .registers 5

    .prologue
    .line 246
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_30

    .line 247
    :cond_d
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mail."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".localhost"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 248
    invoke-virtual {v1, v2}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    .line 249
    :cond_30
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_3c

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_5f

    .line 250
    :cond_3c
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mail."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".localaddress"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 251
    invoke-virtual {v1, v2}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;
    :try_end_5f
    .catchall {:try_start_1 .. :try_end_5f} :catchall_e3

    .line 253
    :cond_5f
    :try_start_5f
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_6b

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_98

    .line 254
    :cond_6b
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v0

    .line 255
    .local v0, "localHost":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    .line 257
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-nez v1, :cond_98

    .line 259
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;
    :try_end_98
    .catch Ljava/net/UnknownHostException; {:try_start_5f .. :try_end_98} :catch_e6
    .catchall {:try_start_5f .. :try_end_98} :catchall_e3

    .line 265
    .end local v0    # "localHost":Ljava/net/InetAddress;
    :cond_98
    :goto_98
    :try_start_98
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_a4

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_df

    .line 266
    :cond_a4
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v1, :cond_df

    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->isBound()Z

    move-result v1

    if-eqz v1, :cond_df

    .line 267
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 268
    .restart local v0    # "localHost":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    .line 270
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    if-nez v1, :cond_df

    .line 272
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;

    .line 275
    .end local v0    # "localHost":Ljava/net/InetAddress;
    :cond_df
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;
    :try_end_e1
    .catchall {:try_start_98 .. :try_end_e1} :catchall_e3

    monitor-exit p0

    return-object v1

    .line 246
    :catchall_e3
    move-exception v1

    monitor-exit p0

    throw v1

    .line 261
    :catch_e6
    move-exception v1

    goto :goto_98
.end method

.method public declared-synchronized getNTLMDomain()Ljava/lang/String;
    .registers 4

    .prologue
    .line 457
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->ntlmDomain:Ljava/lang/String;

    const-string v1, "UNKNOWN"

    if-ne v0, v1, :cond_2a

    .line 458
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".auth.ntlm.domain"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 459
    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->ntlmDomain:Ljava/lang/String;

    .line 461
    :cond_2a
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->ntlmDomain:Ljava/lang/String;
    :try_end_2c
    .catchall {:try_start_1 .. :try_end_2c} :catchall_2e

    monitor-exit p0

    return-object v0

    .line 457
    :catchall_2e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNoopStrict()Z
    .registers 2

    .prologue
    .line 593
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->noopStrict:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getReportSuccess()Z
    .registers 2

    .prologue
    .line 490
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->reportSuccess:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRequireStartTLS()Z
    .registers 2

    .prologue
    .line 536
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->requireStartTLS:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSASLEnabled()Z
    .registers 2

    .prologue
    .line 338
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSASLMechanisms()[Ljava/lang/String;
    .registers 8

    .prologue
    .line 413
    monitor-enter p0

    :try_start_1
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;

    sget-object v5, Lcom/sun/mail/smtp/SMTPTransport;->UNKNOWN_SA:[Ljava/lang/String;

    if-ne v4, v5, :cond_83

    .line 414
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 415
    .local v3, "v":Ljava/util/List;
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mail."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".sasl.mechanisms"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 416
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_76

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_76

    .line 417
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_58

    .line 418
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SASL mechanisms allowed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 419
    :cond_58
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v4, " ,"

    invoke-direct {v2, v1, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    .local v2, "st":Ljava/util/StringTokenizer;
    :cond_5f
    :goto_5f
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_76

    .line 421
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 422
    .local v0, "m":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5f

    .line 423
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_72
    .catchall {:try_start_1 .. :try_end_72} :catchall_73

    goto :goto_5f

    .line 413
    .end local v0    # "m":Ljava/lang/String;
    .end local v1    # "s":Ljava/lang/String;
    .end local v2    # "st":Ljava/util/StringTokenizer;
    .end local v3    # "v":Ljava/util/List;
    :catchall_73
    move-exception v4

    monitor-exit p0

    throw v4

    .line 426
    .restart local v1    # "s":Ljava/lang/String;
    .restart local v3    # "v":Ljava/util/List;
    :cond_76
    :try_start_76
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;

    .line 427
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 429
    .end local v1    # "s":Ljava/lang/String;
    .end local v3    # "v":Ljava/util/List;
    :cond_83
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;
    :try_end_85
    .catchall {:try_start_76 .. :try_end_85} :catchall_73

    if-nez v4, :cond_8a

    .line 430
    const/4 v4, 0x0

    .line 431
    :goto_88
    monitor-exit p0

    return-object v4

    :cond_8a
    :try_start_8a
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;

    invoke-virtual {v4}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;
    :try_end_94
    .catchall {:try_start_8a .. :try_end_94} :catchall_73

    goto :goto_88
.end method

.method public declared-synchronized getSASLRealm()Ljava/lang/String;
    .registers 4

    .prologue
    .line 360
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;

    const-string v1, "UNKNOWN"

    if-ne v0, v1, :cond_51

    .line 361
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".sasl.realm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;

    .line 362
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;

    if-nez v0, :cond_51

    .line 363
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mail."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".saslrealm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;

    .line 365
    :cond_51
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;
    :try_end_53
    .catchall {:try_start_1 .. :try_end_53} :catchall_55

    monitor-exit p0

    return-object v0

    .line 360
    :catchall_55
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getStartTLS()Z
    .registers 2

    .prologue
    .line 514
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->useStartTLS:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUseCanonicalHostName()Z
    .registers 2

    .prologue
    .line 388
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUseRset()Z
    .registers 2

    .prologue
    .line 569
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->useRset:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected helo(Ljava/lang/String;)V
    .registers 5
    .param p1, "domain"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/16 v2, 0xfa

    .line 1552
    if-eqz p1, :cond_1b

    .line 1553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HELO "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V

    .line 1556
    :goto_1a
    return-void

    .line 1555
    :cond_1b
    const-string v0, "HELO"

    invoke-virtual {p0, v0, v2}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V

    goto :goto_1a
.end method

.method public declared-synchronized isConnected()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 1322
    monitor-enter p0

    :try_start_2
    invoke-super {p0}, Lkorex/mail/Transport;->isConnected()Z
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_3a

    move-result v3

    if-nez v3, :cond_a

    .line 1368
    :goto_8
    monitor-exit p0

    return v2

    .line 1329
    :cond_a
    :try_start_a
    iget-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->useRset:Z

    if-eqz v3, :cond_23

    .line 1330
    const-string v3, "RSET"

    invoke-virtual {p0, v3}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 1333
    :goto_13
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v1

    .line 1352
    .local v1, "resp":I
    if-ltz v1, :cond_34

    iget-boolean v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->noopStrict:Z

    if-eqz v3, :cond_30

    const/16 v3, 0xfa

    if-ne v1, v3, :cond_34

    .line 1353
    :cond_21
    const/4 v2, 0x1

    goto :goto_8

    .line 1332
    .end local v1    # "resp":I
    :cond_23
    const-string v3, "NOOP"

    invoke-virtual {p0, v3}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_28} :catch_29
    .catchall {:try_start_a .. :try_end_28} :catchall_3a

    goto :goto_13

    .line 1362
    :catch_29
    move-exception v0

    .line 1364
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2a
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_2d
    .catch Lkorex/mail/MessagingException; {:try_start_2a .. :try_end_2d} :catch_2e
    .catchall {:try_start_2a .. :try_end_2d} :catchall_3a

    goto :goto_8

    .line 1365
    :catch_2e
    move-exception v3

    goto :goto_8

    .line 1352
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "resp":I
    :cond_30
    const/16 v3, 0x1a5

    if-ne v1, v3, :cond_21

    .line 1356
    :cond_34
    :try_start_34
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_37
    .catch Lkorex/mail/MessagingException; {:try_start_34 .. :try_end_37} :catch_38
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_37} :catch_29
    .catchall {:try_start_34 .. :try_end_37} :catchall_3a

    goto :goto_8

    .line 1357
    :catch_38
    move-exception v3

    goto :goto_8

    .line 1322
    .end local v1    # "resp":I
    :catchall_3a
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized isSSL()Z
    .registers 2

    .prologue
    .line 557
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_7

    monitor-exit p0

    return v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized issueCommand(Ljava/lang/String;I)V
    .registers 6
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "expect"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2163
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 2167
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v0

    .line 2168
    .local v0, "resp":I
    const/4 v1, -0x1

    if-eq p2, v1, :cond_18

    if-eq v0, p2, :cond_18

    .line 2169
    new-instance v1, Lkorex/mail/MessagingException;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_15

    .line 2163
    .end local v0    # "resp":I
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1

    .line 2170
    .restart local v0    # "resp":I
    :cond_18
    monitor-exit p0

    return-void
.end method

.method protected mailFrom()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1623
    const/4 v4, 0x0

    .line 1624
    .local v4, "from":Ljava/lang/String;
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v10, v10, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v10, :cond_f

    .line 1625
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v10, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v10}, Lcom/sun/mail/smtp/SMTPMessage;->getEnvelopeFrom()Ljava/lang/String;

    move-result-object v4

    .line 1626
    :cond_f
    if-eqz v4, :cond_17

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-gtz v10, :cond_38

    .line 1627
    :cond_17
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mail."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".from"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1628
    :cond_38
    if-eqz v4, :cond_40

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    if-gtz v10, :cond_5a

    .line 1631
    :cond_40
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    if-eqz v10, :cond_172

    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    invoke-virtual {v10}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v3

    .local v3, "fa":[Lkorex/mail/Address;
    if-eqz v3, :cond_172

    array-length v10, v3

    if-lez v10, :cond_172

    .line 1633
    const/4 v10, 0x0

    aget-object v5, v3, v10

    .line 1637
    .end local v3    # "fa":[Lkorex/mail/Address;
    .local v5, "me":Lkorex/mail/Address;
    :goto_52
    if-eqz v5, :cond_17a

    .line 1638
    check-cast v5, Lkorex/mail/internet/InternetAddress;

    .end local v5    # "me":Lkorex/mail/Address;
    invoke-virtual {v5}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v4

    .line 1644
    :cond_5a
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "MAIL FROM:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-direct {p0, v4}, Lcom/sun/mail/smtp/SMTPTransport;->normalizeAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1647
    .local v0, "cmd":Ljava/lang/String;
    const-string v10, "DSN"

    invoke-virtual {p0, v10}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c4

    .line 1648
    const/4 v6, 0x0

    .line 1649
    .local v6, "ret":Ljava/lang/String;
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v10, v10, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v10, :cond_88

    .line 1650
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v10, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v10}, Lcom/sun/mail/smtp/SMTPMessage;->getDSNRet()Ljava/lang/String;

    move-result-object v6

    .line 1651
    :cond_88
    if-nez v6, :cond_ab

    .line 1652
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mail."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".dsn.ret"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1654
    :cond_ab
    if-eqz v6, :cond_c4

    .line 1655
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " RET="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1663
    .end local v6    # "ret":Ljava/lang/String;
    :cond_c4
    const-string v10, "AUTH"

    invoke-virtual {p0, v10}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_11b

    .line 1664
    const/4 v9, 0x0

    .line 1665
    .local v9, "submitter":Ljava/lang/String;
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v10, v10, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v10, :cond_db

    .line 1666
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v10, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v10}, Lcom/sun/mail/smtp/SMTPMessage;->getSubmitter()Ljava/lang/String;

    move-result-object v9

    .line 1667
    :cond_db
    if-nez v9, :cond_fe

    .line 1668
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mail."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".submitter"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1670
    :cond_fe
    if-eqz v9, :cond_11b

    .line 1672
    :try_start_100
    invoke-static {v9}, Lcom/sun/mail/smtp/SMTPTransport;->xtext(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1673
    .local v8, "s":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " AUTH="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_11a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_100 .. :try_end_11a} :catch_182

    move-result-object v0

    .line 1685
    .end local v8    # "s":Ljava/lang/String;
    .end local v9    # "submitter":Ljava/lang/String;
    :cond_11b
    :goto_11b
    const/4 v2, 0x0

    .line 1686
    .local v2, "ext":Ljava/lang/String;
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v10, v10, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v10, :cond_12a

    .line 1687
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v10, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v10}, Lcom/sun/mail/smtp/SMTPMessage;->getMailExtension()Ljava/lang/String;

    move-result-object v2

    .line 1688
    :cond_12a
    if-nez v2, :cond_14d

    .line 1689
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mail."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".mailextension"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1690
    :cond_14d
    if-eqz v2, :cond_16c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_16c

    .line 1691
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1694
    :cond_16c
    const/16 v10, 0xfa

    :try_start_16e
    invoke-direct {p0, v0, v10}, Lcom/sun/mail/smtp/SMTPTransport;->issueSendCommand(Ljava/lang/String;I)V
    :try_end_171
    .catch Lcom/sun/mail/smtp/SMTPSendFailedException; {:try_start_16e .. :try_end_171} :catch_1a9

    .line 1713
    return-void

    .line 1635
    .end local v0    # "cmd":Ljava/lang/String;
    .end local v2    # "ext":Ljava/lang/String;
    :cond_172
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    invoke-static {v10}, Lkorex/mail/internet/InternetAddress;->getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;

    move-result-object v5

    .restart local v5    # "me":Lkorex/mail/Address;
    goto/16 :goto_52

    .line 1640
    :cond_17a
    new-instance v10, Lkorex/mail/MessagingException;

    const-string v11, "can\'t determine local email address"

    invoke-direct {v10, v11}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1674
    .end local v5    # "me":Lkorex/mail/Address;
    .restart local v0    # "cmd":Ljava/lang/String;
    .restart local v9    # "submitter":Ljava/lang/String;
    :catch_182
    move-exception v1

    .line 1675
    .local v1, "ex":Ljava/lang/IllegalArgumentException;
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v10, v11}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v10

    if-eqz v10, :cond_11b

    .line 1676
    iget-object v10, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "ignoring invalid submitter: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12, v1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11b

    .line 1695
    .end local v1    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v9    # "submitter":Ljava/lang/String;
    .restart local v2    # "ext":Ljava/lang/String;
    :catch_1a9
    move-exception v1

    .line 1696
    .local v1, "ex":Lcom/sun/mail/smtp/SMTPSendFailedException;
    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPSendFailedException;->getReturnCode()I

    move-result v7

    .line 1697
    .local v7, "retCode":I
    sparse-switch v7, :sswitch_data_1c6

    .line 1711
    :goto_1b1
    throw v1

    .line 1701
    :sswitch_1b2
    :try_start_1b2
    new-instance v10, Lcom/sun/mail/smtp/SMTPSenderFailedException;

    new-instance v11, Lkorex/mail/internet/InternetAddress;

    invoke-direct {v11, v4}, Lkorex/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    .line 1703
    invoke-virtual {v1}, Lcom/sun/mail/smtp/SMTPSendFailedException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v0, v7, v12}, Lcom/sun/mail/smtp/SMTPSenderFailedException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    .line 1701
    invoke-virtual {v1, v10}, Lcom/sun/mail/smtp/SMTPSendFailedException;->setNextException(Ljava/lang/Exception;)Z
    :try_end_1c3
    .catch Lkorex/mail/internet/AddressException; {:try_start_1b2 .. :try_end_1c3} :catch_1c4

    goto :goto_1b1

    .line 1704
    :catch_1c4
    move-exception v10

    goto :goto_1b1

    .line 1697
    :sswitch_data_1c6
    .sparse-switch
        0x1f5 -> :sswitch_1b2
        0x1f7 -> :sswitch_1b2
        0x226 -> :sswitch_1b2
        0x227 -> :sswitch_1b2
        0x229 -> :sswitch_1b2
    .end sparse-switch
.end method

.method protected notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V
    .registers 7
    .param p1, "type"    # I
    .param p2, "validSent"    # [Lkorex/mail/Address;
    .param p3, "validUnsent"    # [Lkorex/mail/Address;
    .param p4, "invalid"    # [Lkorex/mail/Address;
    .param p5, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 1382
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->notificationDone:Z

    if-nez v0, :cond_a

    .line 1383
    invoke-super/range {p0 .. p5}, Lkorex/mail/Transport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 1385
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->notificationDone:Z

    .line 1387
    :cond_a
    return-void
.end method

.method protected declared-synchronized protocolConnect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 14
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v0, 0x0

    const/4 v8, -0x1

    .line 655
    monitor-enter p0

    :try_start_4
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".auth"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v2

    .line 664
    .local v2, "useAuth":Z
    if-eqz v2, :cond_35

    if-eqz p3, :cond_2c

    if-nez p4, :cond_35

    .line 665
    :cond_2c
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "need username and password for authentication"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_33
    .catchall {:try_start_4 .. :try_end_33} :catchall_115

    .line 745
    :cond_33
    :goto_33
    monitor-exit p0

    return v0

    .line 670
    :cond_35
    :try_start_35
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".ehlo"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v5, v6, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v3

    .line 672
    .local v3, "useEhlo":Z
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v5

    if-eqz v5, :cond_83

    .line 673
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "useEhlo "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", useAuth "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 679
    :cond_83
    if-ne p2, v8, :cond_a7

    .line 680
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mail."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".port"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, -0x1

    invoke-static {v5, v6, v7}, Lcom/sun/mail/util/PropUtil;->getIntSessionProperty(Lkorex/mail/Session;Ljava/lang/String;I)I

    move-result p2

    .line 682
    :cond_a7
    if-ne p2, v8, :cond_ab

    .line 683
    iget p2, p0, Lcom/sun/mail/smtp/SMTPTransport;->defaultPort:I

    .line 685
    :cond_ab
    if-eqz p1, :cond_b3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_b5

    .line 686
    :cond_b3
    const-string p1, "localhost"
    :try_end_b5
    .catchall {:try_start_35 .. :try_end_b5} :catchall_115

    .line 692
    :cond_b5
    const/4 v0, 0x0

    .line 695
    .local v0, "connected":Z
    :try_start_b6
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v5, :cond_10a

    .line 696
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->openServer()V

    .line 700
    :goto_bd
    const/4 v1, 0x0

    .line 701
    .local v1, "succeed":Z
    if-eqz v3, :cond_c8

    .line 702
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->ehlo(Ljava/lang/String;)Z

    move-result v1

    .line 703
    :cond_c8
    if-nez v1, :cond_d1

    .line 704
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->helo(Ljava/lang/String;)V

    .line 706
    :cond_d1
    iget-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->useStartTLS:Z

    if-nez v5, :cond_d9

    iget-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->requireStartTLS:Z

    if-eqz v5, :cond_e6

    .line 707
    :cond_d9
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    instance-of v5, v5, Ljavax/net/ssl/SSLSocket;

    if-eqz v5, :cond_118

    .line 708
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "STARTTLS requested but already using SSL"

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 726
    :cond_e6
    :goto_e6
    if-nez v2, :cond_ec

    if-eqz p3, :cond_13e

    if-eqz p4, :cond_13e

    :cond_ec
    const-string v5, "AUTH"

    .line 727
    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_fc

    const-string v5, "AUTH=LOGIN"

    .line 728
    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_13e

    .line 729
    :cond_fc
    invoke-direct {p0, p3, p4}, Lcom/sun/mail/smtp/SMTPTransport;->authenticate(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_ff
    .catchall {:try_start_b6 .. :try_end_ff} :catchall_10e

    move-result v0

    .line 740
    if-nez v0, :cond_33

    .line 742
    :try_start_102
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_105
    .catch Lkorex/mail/MessagingException; {:try_start_102 .. :try_end_105} :catch_107
    .catchall {:try_start_102 .. :try_end_105} :catchall_115

    goto/16 :goto_33

    .line 743
    :catch_107
    move-exception v4

    goto/16 :goto_33

    .line 698
    .end local v1    # "succeed":Z
    :cond_10a
    :try_start_10a
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/smtp/SMTPTransport;->openServer(Ljava/lang/String;I)V
    :try_end_10d
    .catchall {:try_start_10a .. :try_end_10d} :catchall_10e

    goto :goto_bd

    .line 740
    :catchall_10e
    move-exception v4

    if-nez v0, :cond_114

    .line 742
    :try_start_111
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_114
    .catch Lkorex/mail/MessagingException; {:try_start_111 .. :try_end_114} :catch_149
    .catchall {:try_start_111 .. :try_end_114} :catchall_115

    .line 745
    :cond_114
    :goto_114
    :try_start_114
    throw v4
    :try_end_115
    .catchall {:try_start_114 .. :try_end_115} :catchall_115

    .line 655
    .end local v0    # "connected":Z
    .end local v2    # "useAuth":Z
    .end local v3    # "useEhlo":Z
    :catchall_115
    move-exception v4

    monitor-exit p0

    throw v4

    .line 709
    .restart local v0    # "connected":Z
    .restart local v1    # "succeed":Z
    .restart local v2    # "useAuth":Z
    .restart local v3    # "useEhlo":Z
    :cond_118
    :try_start_118
    const-string v5, "STARTTLS"

    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_12b

    .line 710
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->startTLS()V

    .line 717
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->ehlo(Ljava/lang/String;)Z

    goto :goto_e6

    .line 718
    :cond_12b
    iget-boolean v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->requireStartTLS:Z

    if-eqz v5, :cond_e6

    .line 719
    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "STARTTLS required but not supported"

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 720
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "STARTTLS is required but host does not support STARTTLS"

    invoke-direct {v4, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_13e
    .catchall {:try_start_118 .. :try_end_13e} :catchall_10e

    .line 734
    :cond_13e
    const/4 v0, 0x1

    .line 740
    if-nez v0, :cond_144

    .line 742
    :try_start_141
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_144
    .catch Lkorex/mail/MessagingException; {:try_start_141 .. :try_end_144} :catch_147
    .catchall {:try_start_141 .. :try_end_144} :catchall_115

    :cond_144
    :goto_144
    move v0, v4

    .line 745
    goto/16 :goto_33

    .line 743
    :catch_147
    move-exception v5

    goto :goto_144

    .end local v1    # "succeed":Z
    :catch_149
    move-exception v5

    goto :goto_114
.end method

.method protected rcptTo()V
    .registers 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1738
    new-instance v30, Ljava/util/Vector;

    invoke-direct/range {v30 .. v30}, Ljava/util/Vector;-><init>()V

    .line 1739
    .local v30, "valid":Ljava/util/Vector;
    new-instance v31, Ljava/util/Vector;

    invoke-direct/range {v31 .. v31}, Ljava/util/Vector;-><init>()V

    .line 1740
    .local v31, "validUnsent":Ljava/util/Vector;
    new-instance v18, Ljava/util/Vector;

    invoke-direct/range {v18 .. v18}, Ljava/util/Vector;-><init>()V

    .line 1741
    .local v18, "invalid":Ljava/util/Vector;
    const/16 v26, -0x1

    .line 1742
    .local v26, "retCode":I
    const/16 v24, 0x0

    .line 1743
    .local v24, "mex":Lkorex/mail/MessagingException;
    const/16 v27, 0x0

    .line 1744
    .local v27, "sendFailed":Z
    const/16 v29, 0x0

    .line 1745
    .local v29, "sfex":Lkorex/mail/MessagingException;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 1746
    const/16 v28, 0x0

    .line 1747
    .local v28, "sendPartial":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v3, v3, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v3, :cond_38

    .line 1748
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v3, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v3}, Lcom/sun/mail/smtp/SMTPMessage;->getSendPartial()Z

    move-result v28

    .line 1749
    :cond_38
    if-nez v28, :cond_60

    .line 1750
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".sendpartial"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v28

    .line 1752
    :cond_60
    if-eqz v28, :cond_6b

    .line 1753
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "sendPartial set"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1755
    :cond_6b
    const/4 v12, 0x0

    .line 1756
    .local v12, "dsn":Z
    const/16 v25, 0x0

    .line 1757
    .local v25, "notify":Ljava/lang/String;
    const-string v3, "DSN"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b4

    .line 1758
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    instance-of v3, v3, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v3, :cond_8a

    .line 1759
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    check-cast v3, Lcom/sun/mail/smtp/SMTPMessage;

    invoke-virtual {v3}, Lcom/sun/mail/smtp/SMTPMessage;->getDSNNotify()Ljava/lang/String;

    move-result-object v25

    .line 1760
    :cond_8a
    if-nez v25, :cond_b1

    .line 1761
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".dsn.notify"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1763
    :cond_b1
    if-eqz v25, :cond_b4

    .line 1764
    const/4 v12, 0x1

    .line 1768
    :cond_b4
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_b5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    array-length v3, v3

    if-ge v15, v3, :cond_22b

    .line 1770
    const/16 v29, 0x0

    .line 1771
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    aget-object v17, v3, v15

    check-cast v17, Lkorex/mail/internet/InternetAddress;

    .line 1772
    .local v17, "ia":Lkorex/mail/internet/InternetAddress;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RCPT TO:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v17 .. v17}, Lkorex/mail/internet/InternetAddress;->getAddress()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/sun/mail/smtp/SMTPTransport;->normalizeAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1773
    .local v11, "cmd":Ljava/lang/String;
    if-eqz v12, :cond_fe

    .line 1774
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " NOTIFY="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v25

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1776
    :cond_fe
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 1778
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v26

    .line 1779
    sparse-switch v26, :sswitch_data_460

    .line 1827
    const/16 v3, 0x190

    move/from16 v0, v26

    if-lt v0, v3, :cond_1af

    const/16 v3, 0x1f3

    move/from16 v0, v26

    if-gt v0, v3, :cond_1af

    .line 1829
    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1847
    :goto_11d
    if-nez v28, :cond_121

    .line 1848
    const/16 v27, 0x1

    .line 1850
    :cond_121
    new-instance v29, Lcom/sun/mail/smtp/SMTPAddressFailedException;

    .end local v29    # "sfex":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    move/from16 v2, v26

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/sun/mail/smtp/SMTPAddressFailedException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    .line 1852
    .restart local v29    # "sfex":Lkorex/mail/MessagingException;
    if-nez v24, :cond_222

    .line 1853
    move-object/from16 v24, v29

    .line 1768
    :cond_134
    :goto_134
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_b5

    .line 1781
    :sswitch_138
    move-object/from16 v0, v30

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1782
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->reportSuccess:Z

    if-eqz v3, :cond_134

    .line 1789
    new-instance v29, Lcom/sun/mail/smtp/SMTPAddressSucceededException;

    .end local v29    # "sfex":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    move/from16 v2, v26

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/sun/mail/smtp/SMTPAddressSucceededException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    .line 1791
    .restart local v29    # "sfex":Lkorex/mail/MessagingException;
    if-nez v24, :cond_159

    .line 1792
    move-object/from16 v24, v29

    goto :goto_134

    .line 1794
    :cond_159
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    goto :goto_134

    .line 1799
    :sswitch_161
    if-nez v28, :cond_165

    .line 1800
    const/16 v27, 0x1

    .line 1801
    :cond_165
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1803
    new-instance v29, Lcom/sun/mail/smtp/SMTPAddressFailedException;

    .end local v29    # "sfex":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    move/from16 v2, v26

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/sun/mail/smtp/SMTPAddressFailedException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    .line 1805
    .restart local v29    # "sfex":Lkorex/mail/MessagingException;
    if-nez v24, :cond_180

    .line 1806
    move-object/from16 v24, v29

    goto :goto_134

    .line 1808
    :cond_180
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    goto :goto_134

    .line 1813
    :sswitch_188
    if-nez v28, :cond_18c

    .line 1814
    const/16 v27, 0x1

    .line 1815
    :cond_18c
    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1817
    new-instance v29, Lcom/sun/mail/smtp/SMTPAddressFailedException;

    .end local v29    # "sfex":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v17

    move/from16 v2, v26

    invoke-direct {v0, v1, v11, v2, v3}, Lcom/sun/mail/smtp/SMTPAddressFailedException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    .line 1819
    .restart local v29    # "sfex":Lkorex/mail/MessagingException;
    if-nez v24, :cond_1a7

    .line 1820
    move-object/from16 v24, v29

    goto :goto_134

    .line 1822
    :cond_1a7
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    goto :goto_134

    .line 1830
    :cond_1af
    const/16 v3, 0x1f4

    move/from16 v0, v26

    if-lt v0, v3, :cond_1c4

    const/16 v3, 0x257

    move/from16 v0, v26

    if-gt v0, v3, :cond_1c4

    .line 1832
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_11d

    .line 1835
    :cond_1c4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_1fa

    .line 1836
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "got response code "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", with response: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1838
    :cond_1fa
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 1839
    .local v10, "_lsr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v9, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 1840
    .local v9, "_lrc":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v3, :cond_210

    .line 1841
    const-string v3, "RSET"

    const/4 v4, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V

    .line 1842
    :cond_210
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 1843
    move-object/from16 v0, p0

    iput v9, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 1844
    new-instance v3, Lcom/sun/mail/smtp/SMTPAddressFailedException;

    move-object/from16 v0, v17

    move/from16 v1, v26

    invoke-direct {v3, v0, v11, v1, v10}, Lcom/sun/mail/smtp/SMTPAddressFailedException;-><init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V

    throw v3

    .line 1855
    .end local v9    # "_lrc":I
    .end local v10    # "_lsr":Ljava/lang/String;
    :cond_222
    move-object/from16 v0, v24

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    goto/16 :goto_134

    .line 1862
    .end local v11    # "cmd":Ljava/lang/String;
    .end local v17    # "ia":Lkorex/mail/internet/InternetAddress;
    :cond_22b
    if-eqz v28, :cond_235

    invoke-virtual/range {v30 .. v30}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_235

    .line 1863
    const/16 v27, 0x1

    .line 1866
    :cond_235
    if-eqz v27, :cond_29c

    .line 1868
    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v3, v3, [Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    .line 1869
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1872
    invoke-virtual/range {v30 .. v30}, Ljava/util/Vector;->size()I

    move-result v3

    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v4

    add-int/2addr v3, v4

    new-array v3, v3, [Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 1873
    const/4 v15, 0x0

    .line 1874
    const/16 v19, 0x0

    .local v19, "j":I
    :goto_25c
    invoke-virtual/range {v30 .. v30}, Ljava/util/Vector;->size()I

    move-result v3

    move/from16 v0, v19

    if-ge v0, v3, :cond_27b

    .line 1875
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .local v16, "i":I
    move-object/from16 v0, v30

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkorex/mail/Address;

    aput-object v3, v4, v15

    .line 1874
    add-int/lit8 v19, v19, 0x1

    move/from16 v15, v16

    .end local v16    # "i":I
    .restart local v15    # "i":I
    goto :goto_25c

    .line 1876
    :cond_27b
    const/16 v19, 0x0

    :goto_27d
    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v3

    move/from16 v0, v19

    if-ge v0, v3, :cond_2f4

    .line 1877
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .restart local v16    # "i":I
    move-object/from16 v0, v31

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkorex/mail/Address;

    aput-object v3, v4, v15

    .line 1876
    add-int/lit8 v19, v19, 0x1

    move/from16 v15, v16

    .end local v16    # "i":I
    .restart local v15    # "i":I
    goto :goto_27d

    .line 1878
    .end local v19    # "j":I
    :cond_29c
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->reportSuccess:Z

    if-nez v3, :cond_2b0

    if-eqz v28, :cond_344

    .line 1879
    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->size()I

    move-result v3

    if-gtz v3, :cond_2b0

    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_344

    .line 1882
    :cond_2b0
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->sendPartiallyFailed:Z

    .line 1883
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->exception:Lkorex/mail/MessagingException;

    .line 1886
    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v3, v3, [Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    .line 1887
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1890
    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v3, v3, [Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 1891
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1894
    invoke-virtual/range {v30 .. v30}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v3, v3, [Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 1895
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1902
    :cond_2f4
    :goto_2f4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_3d5

    .line 1903
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    if-eqz v3, :cond_34d

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v3, v3

    if-lez v3, :cond_34d

    .line 1904
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "Verified Addresses"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1905
    const/16 v21, 0x0

    .local v21, "l":I
    :goto_318
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    array-length v3, v3

    move/from16 v0, v21

    if-ge v0, v3, :cond_34d

    .line 1906
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    aget-object v5, v5, v21

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1905
    add-int/lit8 v21, v21, 0x1

    goto :goto_318

    .line 1897
    .end local v21    # "l":I
    :cond_344
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    goto :goto_2f4

    .line 1909
    :cond_34d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    if-eqz v3, :cond_391

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    array-length v3, v3

    if-lez v3, :cond_391

    .line 1910
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "Valid Unsent Addresses"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1911
    const/16 v19, 0x0

    .restart local v19    # "j":I
    :goto_365
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    array-length v3, v3

    move/from16 v0, v19

    if-ge v0, v3, :cond_391

    .line 1912
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    aget-object v5, v5, v19

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1911
    add-int/lit8 v19, v19, 0x1

    goto :goto_365

    .line 1915
    .end local v19    # "j":I
    :cond_391
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    if-eqz v3, :cond_3d5

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    array-length v3, v3

    if-lez v3, :cond_3d5

    .line 1916
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "Invalid Addresses"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1917
    const/16 v20, 0x0

    .local v20, "k":I
    :goto_3a9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    array-length v3, v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_3d5

    .line 1918
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    aget-object v5, v5, v20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1917
    add-int/lit8 v20, v20, 0x1

    goto :goto_3a9

    .line 1924
    .end local v20    # "k":I
    :cond_3d5
    if-eqz v27, :cond_45e

    .line 1925
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v4, "Sending failed because of invalid destination addresses"

    invoke-virtual {v3, v4}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1927
    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Lcom/sun/mail/smtp/SMTPTransport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 1932
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    move-object/from16 v23, v0

    .line 1933
    .local v23, "lsr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    move/from16 v22, v0

    .line 1935
    .local v22, "lrc":I
    :try_start_402
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    if-eqz v3, :cond_410

    .line 1936
    const-string v3, "RSET"

    const/4 v4, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V
    :try_end_410
    .catch Lkorex/mail/MessagingException; {:try_start_402 .. :try_end_410} :catch_432
    .catchall {:try_start_402 .. :try_end_410} :catchall_450

    .line 1946
    :cond_410
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 1947
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 1950
    :goto_41c
    new-instance v3, Lkorex/mail/SendFailedException;

    const-string v4, "Invalid Addresses"

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    move-object/from16 v5, v24

    invoke-direct/range {v3 .. v8}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V

    throw v3

    .line 1937
    :catch_432
    move-exception v13

    .line 1940
    .local v13, "ex":Lkorex/mail/MessagingException;
    :try_start_433
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/smtp/SMTPTransport;->close()V
    :try_end_436
    .catch Lkorex/mail/MessagingException; {:try_start_433 .. :try_end_436} :catch_443
    .catchall {:try_start_433 .. :try_end_436} :catchall_450

    .line 1946
    :goto_436
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 1947
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    goto :goto_41c

    .line 1941
    :catch_443
    move-exception v14

    .line 1943
    .local v14, "ex2":Lkorex/mail/MessagingException;
    :try_start_444
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v5, "close failed"

    invoke-virtual {v3, v4, v5, v14}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_44f
    .catchall {:try_start_444 .. :try_end_44f} :catchall_450

    goto :goto_436

    .line 1946
    .end local v13    # "ex":Lkorex/mail/MessagingException;
    .end local v14    # "ex2":Lkorex/mail/MessagingException;
    :catchall_450
    move-exception v3

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 1947
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    throw v3

    .line 1954
    .end local v22    # "lrc":I
    .end local v23    # "lsr":Ljava/lang/String;
    :cond_45e
    return-void

    .line 1779
    nop

    :sswitch_data_460
    .sparse-switch
        0xfa -> :sswitch_138
        0xfb -> :sswitch_138
        0x1c2 -> :sswitch_188
        0x1c3 -> :sswitch_188
        0x1c4 -> :sswitch_188
        0x1f5 -> :sswitch_161
        0x1f7 -> :sswitch_161
        0x226 -> :sswitch_161
        0x227 -> :sswitch_161
        0x228 -> :sswitch_188
        0x229 -> :sswitch_161
    .end sparse-switch
.end method

.method protected readServerResponse()I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x3

    const/4 v12, 0x0

    const/4 v8, -0x1

    .line 2274
    sget-boolean v9, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v9, :cond_13

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_13

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 2275
    :cond_13
    const-string v7, ""

    .line 2276
    .local v7, "serverResponse":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2277
    .local v6, "returnCode":I
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v9, 0x64

    invoke-direct {v0, v9}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 2282
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .line 2285
    .local v3, "line":Ljava/lang/String;
    :cond_1e
    :try_start_1e
    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->lineInputStream:Lcom/sun/mail/util/LineInputStream;

    invoke-virtual {v9}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 2286
    if-nez v3, :cond_41

    .line 2287
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2288
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_32

    .line 2289
    const-string v7, "[EOF]"

    .line 2290
    :cond_32
    iput-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 2291
    const/4 v9, -0x1

    iput v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 2292
    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v11, "EOF: {0}"

    invoke-virtual {v9, v10, v11, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2342
    :goto_40
    return v8

    .line 2295
    :cond_41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2296
    const-string v9, "\n"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2297
    invoke-direct {p0, v3}, Lcom/sun/mail/smtp/SMTPTransport;->isNotLastLine(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1e

    .line 2299
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_52} :catch_74

    move-result-object v7

    .line 2314
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-lt v9, v10, :cond_ae

    .line 2316
    const/4 v9, 0x0

    const/4 v10, 0x3

    :try_start_5b
    invoke-virtual {v7, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_62
    .catch Ljava/lang/NumberFormatException; {:try_start_5b .. :try_end_62} :catch_8c
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_5b .. :try_end_62} :catch_9d

    move-result v6

    .line 2337
    :goto_63
    if-ne v6, v8, :cond_6e

    .line 2338
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v10, "bad server response: {0}"

    invoke-virtual {v8, v9, v10, v7}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2340
    :cond_6e
    iput-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 2341
    iput v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    move v8, v6

    .line 2342
    goto :goto_40

    .line 2300
    :catch_74
    move-exception v2

    .line 2301
    .local v2, "ioex":Ljava/io/IOException;
    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v9, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v10, "exception reading response"

    invoke-virtual {v8, v9, v10, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2303
    const-string v8, ""

    iput-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    .line 2304
    iput v12, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    .line 2305
    new-instance v8, Lkorex/mail/MessagingException;

    const-string v9, "Exception reading response"

    invoke-direct {v8, v9, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8

    .line 2317
    .end local v2    # "ioex":Ljava/io/IOException;
    :catch_8c
    move-exception v5

    .line 2319
    .local v5, "nfe":Ljava/lang/NumberFormatException;
    :try_start_8d
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->close()V
    :try_end_90
    .catch Lkorex/mail/MessagingException; {:try_start_8d .. :try_end_90} :catch_92

    .line 2324
    :goto_90
    const/4 v6, -0x1

    .line 2333
    goto :goto_63

    .line 2320
    :catch_92
    move-exception v4

    .line 2322
    .local v4, "mex":Lkorex/mail/MessagingException;
    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v11, "close failed"

    invoke-virtual {v9, v10, v11, v4}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_90

    .line 2325
    .end local v4    # "mex":Lkorex/mail/MessagingException;
    .end local v5    # "nfe":Ljava/lang/NumberFormatException;
    :catch_9d
    move-exception v1

    .line 2327
    .local v1, "ex":Ljava/lang/StringIndexOutOfBoundsException;
    :try_start_9e
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->close()V
    :try_end_a1
    .catch Lkorex/mail/MessagingException; {:try_start_9e .. :try_end_a1} :catch_a3

    .line 2332
    :goto_a1
    const/4 v6, -0x1

    .line 2333
    goto :goto_63

    .line 2328
    :catch_a3
    move-exception v4

    .line 2330
    .restart local v4    # "mex":Lkorex/mail/MessagingException;
    iget-object v9, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v10, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v11, "close failed"

    invoke-virtual {v9, v10, v11, v4}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a1

    .line 2335
    .end local v1    # "ex":Ljava/lang/StringIndexOutOfBoundsException;
    .end local v4    # "mex":Lkorex/mail/MessagingException;
    :cond_ae
    const/4 v6, -0x1

    goto :goto_63
.end method

.method public sasllogin([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 20
    .param p1, "allowed"    # [Ljava/lang/String;
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
    .line 1051
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z

    if-eqz v0, :cond_7b

    .line 1052
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v11

    .line 1055
    .local v11, "serviceHost":Ljava/lang/String;
    :goto_e
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslAuthenticator:Lcom/sun/mail/smtp/SaslAuthenticator;

    if-nez v0, :cond_5c

    .line 1057
    :try_start_12
    const-string v0, "com.sun.mail.smtp.SMTPSaslAuthenticator"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 1059
    .local v10, "sac":Ljava/lang/Class;
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lcom/sun/mail/smtp/SMTPTransport;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    const-class v3, Ljava/util/Properties;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    const-class v3, Lcom/sun/mail/util/MailLogger;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    invoke-virtual {v10, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v7

    .line 1066
    .local v7, "c":Ljava/lang/reflect/Constructor;
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    .line 1070
    invoke-virtual {v3}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    aput-object v11, v0, v2

    .line 1066
    invoke-virtual {v7, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/smtp/SaslAuthenticator;

    iput-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslAuthenticator:Lcom/sun/mail/smtp/SaslAuthenticator;
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_5c} :catch_7e

    .line 1083
    .end local v7    # "c":Ljava/lang/reflect/Constructor;
    .end local v10    # "sac":Ljava/lang/Class;
    :cond_5c
    if-eqz p1, :cond_8a

    array-length v0, p1

    if-lez v0, :cond_8a

    .line 1085
    new-instance v13, Ljava/util/ArrayList;

    array-length v0, p1

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 1086
    .local v13, "v":Ljava/util/List;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_68
    array-length v0, p1

    if-ge v9, v0, :cond_b2

    .line 1087
    aget-object v0, p1, v9

    invoke-virtual {p0, v0}, Lcom/sun/mail/smtp/SMTPTransport;->supportsAuthentication(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 1088
    aget-object v0, p1, v9

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1086
    :cond_78
    add-int/lit8 v9, v9, 0x1

    goto :goto_68

    .line 1054
    .end local v9    # "i":I
    .end local v11    # "serviceHost":Ljava/lang/String;
    .end local v13    # "v":Ljava/util/List;
    :cond_7b
    iget-object v11, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    .restart local v11    # "serviceHost":Ljava/lang/String;
    goto :goto_e

    .line 1074
    :catch_7e
    move-exception v8

    .line 1075
    .local v8, "ex":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "Can\'t load SASL authenticator"

    invoke-virtual {v0, v2, v3, v8}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1077
    const/4 v0, 0x0

    .line 1109
    .end local v8    # "ex":Ljava/lang/Exception;
    :goto_89
    return v0

    .line 1091
    :cond_8a
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1092
    .restart local v13    # "v":Ljava/util/List;
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    if-eqz v0, :cond_b2

    .line 1093
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    const-string v2, "AUTH"

    invoke-virtual {v0, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1094
    .local v6, "a":Ljava/lang/String;
    if-eqz v6, :cond_b2

    .line 1095
    new-instance v12, Ljava/util/StringTokenizer;

    invoke-direct {v12, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 1096
    .local v12, "st":Ljava/util/StringTokenizer;
    :goto_a4
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v0

    if-eqz v0, :cond_b2

    .line 1097
    invoke-virtual {v12}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a4

    .line 1101
    .end local v6    # "a":Ljava/lang/String;
    .end local v12    # "st":Ljava/util/StringTokenizer;
    :cond_b2
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v13, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    move-object v1, v0

    check-cast v1, [Ljava/lang/String;

    .line 1103
    .local v1, "mechs":[Ljava/lang/String;
    :try_start_c1
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->noauthdebug:Z

    if-eqz v0, :cond_d5

    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->isTracing()Z

    move-result v0

    if-eqz v0, :cond_d5

    .line 1104
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "SASL AUTH command trace suppressed"

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1105
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->suspendTracing()V

    .line 1107
    :cond_d5
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslAuthenticator:Lcom/sun/mail/smtp/SaslAuthenticator;

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/sun/mail/smtp/SaslAuthenticator;->authenticate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_e2
    .catchall {:try_start_c1 .. :try_end_e2} :catchall_e7

    move-result v0

    .line 1109
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V

    goto :goto_89

    :catchall_e7
    move-exception v0

    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->resumeTracing()V

    throw v0
.end method

.method protected sendCommand(Ljava/lang/String;)V
    .registers 3
    .param p1, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2247
    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand([B)V

    .line 2248
    return-void
.end method

.method public declared-synchronized sendMessage(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    .registers 16
    .param p1, "message"    # Lkorex/mail/Message;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Lkorex/mail/SendFailedException;
        }
    .end annotation

    .prologue
    .line 1151
    monitor-enter p0

    if-eqz p1, :cond_23

    :try_start_3
    invoke-virtual {p1}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v1

    :goto_7
    invoke-direct {p0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->sendMessageStart(Ljava/lang/String;)V

    .line 1152
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->checkConnected()V

    .line 1156
    instance-of v1, p1, Lkorex/mail/internet/MimeMessage;

    if-nez v1, :cond_26

    .line 1157
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "Can only send RFC822 msgs"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1158
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "SMTP can only send RFC822 messages"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_20

    .line 1151
    .end local p1    # "message":Lkorex/mail/Message;
    :catchall_20
    move-exception v1

    monitor-exit p0

    throw v1

    .restart local p1    # "message":Lkorex/mail/Message;
    :cond_23
    :try_start_23
    const-string v1, ""

    goto :goto_7

    .line 1160
    :cond_26
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_27
    array-length v1, p2

    if-ge v10, v1, :cond_4e

    .line 1161
    aget-object v1, p2, v10

    instance-of v1, v1, Lkorex/mail/internet/InternetAddress;

    if-nez v1, :cond_4b

    .line 1162
    new-instance v1, Lkorex/mail/MessagingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, p2, v10

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not an InternetAddress"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1160
    :cond_4b
    add-int/lit8 v10, v10, 0x1

    goto :goto_27

    .line 1166
    :cond_4e
    array-length v1, p2

    if-nez v1, :cond_59

    .line 1167
    new-instance v1, Lkorex/mail/SendFailedException;

    const-string v2, "No recipient addresses"

    invoke-direct {v1, v2}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1169
    :cond_59
    move-object v0, p1

    check-cast v0, Lkorex/mail/internet/MimeMessage;

    move-object v1, v0

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    .line 1170
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    .line 1171
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    .line 1172
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->expandGroups()V

    .line 1174
    const/4 v12, 0x0

    .line 1175
    .local v12, "use8bit":Z
    instance-of v1, p1, Lcom/sun/mail/smtp/SMTPMessage;

    if-eqz v1, :cond_71

    .line 1176
    check-cast p1, Lcom/sun/mail/smtp/SMTPMessage;

    .end local p1    # "message":Lkorex/mail/Message;
    invoke-virtual {p1}, Lcom/sun/mail/smtp/SMTPMessage;->getAllow8bitMIME()Z

    move-result v12

    .line 1177
    :cond_71
    if-nez v12, :cond_95

    .line 1178
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mail."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".allow8bitmime"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v12

    .line 1180
    :cond_95
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_b7

    .line 1181
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "use8bit "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1182
    :cond_b7
    if-eqz v12, :cond_ce

    const-string v1, "8BITMIME"

    invoke-virtual {p0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ce

    .line 1183
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    invoke-direct {p0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->convertTo8Bit(Lkorex/mail/internet/MimePart;)Z
    :try_end_c6
    .catchall {:try_start_23 .. :try_end_c6} :catchall_20

    move-result v1

    if-eqz v1, :cond_ce

    .line 1187
    :try_start_c9
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    invoke-virtual {v1}, Lkorex/mail/internet/MimeMessage;->saveChanges()V
    :try_end_ce
    .catch Lkorex/mail/MessagingException; {:try_start_c9 .. :try_end_ce} :catch_1a4
    .catchall {:try_start_c9 .. :try_end_ce} :catchall_20

    .line 1195
    :cond_ce
    :goto_ce
    :try_start_ce
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->mailFrom()V

    .line 1196
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->rcptTo()V

    .line 1197
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->data()Ljava/io/OutputStream;

    move-result-object v2

    sget-object v3, Lcom/sun/mail/smtp/SMTPTransport;->ignoreList:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 1198
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->finishData()V

    .line 1199
    iget-boolean v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->sendPartiallyFailed:Z

    if-eqz v1, :cond_153

    .line 1202
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "Sending partially failed because of invalid destination addresses"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 1204
    const/4 v2, 0x3

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/sun/mail/smtp/SMTPTransport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 1209
    new-instance v1, Lcom/sun/mail/smtp/SMTPSendFailedException;

    const-string v2, "."

    iget v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastReturnCode:I

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->lastServerResponse:Ljava/lang/String;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->exception:Lkorex/mail/MessagingException;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v7, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v8, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    invoke-direct/range {v1 .. v8}, Lcom/sun/mail/smtp/SMTPSendFailedException;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V

    throw v1
    :try_end_10e
    .catch Lkorex/mail/MessagingException; {:try_start_ce .. :try_end_10e} :catch_10e
    .catch Ljava/io/IOException; {:try_start_ce .. :try_end_10e} :catch_17b
    .catchall {:try_start_ce .. :try_end_10e} :catchall_13b

    .line 1216
    :catch_10e
    move-exception v11

    .line 1217
    .local v11, "mex":Lkorex/mail/MessagingException;
    :try_start_10f
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "MessagingException while sending"

    invoke-virtual {v1, v2, v3, v11}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1219
    invoke-virtual {v11}, Lkorex/mail/MessagingException;->getNextException()Ljava/lang/Exception;

    move-result-object v1

    instance-of v1, v1, Ljava/io/IOException;

    if-eqz v1, :cond_12a

    .line 1222
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v2, "nested IOException, closing"

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_127
    .catchall {:try_start_10f .. :try_end_127} :catchall_13b

    .line 1224
    :try_start_127
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_12a
    .catch Lkorex/mail/MessagingException; {:try_start_127 .. :try_end_12a} :catch_1a0
    .catchall {:try_start_127 .. :try_end_12a} :catchall_13b

    .line 1227
    :cond_12a
    :goto_12a
    :try_start_12a
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->addressesFailed()V

    .line 1228
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/sun/mail/smtp/SMTPTransport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 1232
    throw v11
    :try_end_13b
    .catchall {:try_start_12a .. :try_end_13b} :catchall_13b

    .line 1249
    .end local v11    # "mex":Lkorex/mail/MessagingException;
    :catchall_13b
    move-exception v1

    const/4 v2, 0x0

    :try_start_13d
    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 1250
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    .line 1251
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    .line 1252
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->exception:Lkorex/mail/MessagingException;

    .line 1253
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->sendPartiallyFailed:Z

    .line 1254
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->notificationDone:Z

    throw v1
    :try_end_153
    .catchall {:try_start_13d .. :try_end_153} :catchall_20

    .line 1213
    :cond_153
    const/4 v2, 0x1

    :try_start_154
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/sun/mail/smtp/SMTPTransport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V
    :try_end_160
    .catch Lkorex/mail/MessagingException; {:try_start_154 .. :try_end_160} :catch_10e
    .catch Ljava/io/IOException; {:try_start_154 .. :try_end_160} :catch_17b
    .catchall {:try_start_154 .. :try_end_160} :catchall_13b

    .line 1249
    const/4 v1, 0x0

    :try_start_161
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    .line 1250
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->addresses:[Lkorex/mail/Address;

    .line 1251
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    .line 1252
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->exception:Lkorex/mail/MessagingException;

    .line 1253
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->sendPartiallyFailed:Z

    .line 1254
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->notificationDone:Z

    .line 1256
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->sendMessageEnd()V
    :try_end_179
    .catchall {:try_start_161 .. :try_end_179} :catchall_20

    .line 1257
    monitor-exit p0

    return-void

    .line 1233
    :catch_17b
    move-exception v9

    .line 1234
    .local v9, "ex":Ljava/io/IOException;
    :try_start_17c
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v3, "IOException while sending, closing"

    invoke-virtual {v1, v2, v3, v9}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_185
    .catchall {:try_start_17c .. :try_end_185} :catchall_13b

    .line 1238
    :try_start_185
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V
    :try_end_188
    .catch Lkorex/mail/MessagingException; {:try_start_185 .. :try_end_188} :catch_1a2
    .catchall {:try_start_185 .. :try_end_188} :catchall_13b

    .line 1240
    :goto_188
    :try_start_188
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->addressesFailed()V

    .line 1241
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->validSentAddr:[Lkorex/mail/Address;

    iget-object v4, p0, Lcom/sun/mail/smtp/SMTPTransport;->validUnsentAddr:[Lkorex/mail/Address;

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->invalidAddr:[Lkorex/mail/Address;

    iget-object v6, p0, Lcom/sun/mail/smtp/SMTPTransport;->message:Lkorex/mail/internet/MimeMessage;

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/sun/mail/smtp/SMTPTransport;->notifyTransportListeners(I[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;Lkorex/mail/Message;)V

    .line 1245
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "IOException while sending message"

    invoke-direct {v1, v2, v9}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
    :try_end_1a0
    .catchall {:try_start_188 .. :try_end_1a0} :catchall_13b

    .line 1225
    .end local v9    # "ex":Ljava/io/IOException;
    .restart local v11    # "mex":Lkorex/mail/MessagingException;
    :catch_1a0
    move-exception v1

    goto :goto_12a

    .line 1239
    .end local v11    # "mex":Lkorex/mail/MessagingException;
    .restart local v9    # "ex":Ljava/io/IOException;
    :catch_1a2
    move-exception v1

    goto :goto_188

    .line 1188
    .end local v9    # "ex":Ljava/io/IOException;
    :catch_1a4
    move-exception v1

    goto/16 :goto_ce
.end method

.method public declared-synchronized setAuthorizationID(Ljava/lang/String;)V
    .registers 3
    .param p1, "authzid"    # Ljava/lang/String;

    .prologue
    .line 327
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->authorizationID:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 328
    monitor-exit p0

    return-void

    .line 327
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLocalHost(Ljava/lang/String;)V
    .registers 3
    .param p1, "localhost"    # Ljava/lang/String;

    .prologue
    .line 285
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->localHostName:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 286
    monitor-exit p0

    return-void

    .line 285
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNTLMDomain(Ljava/lang/String;)V
    .registers 3
    .param p1, "ntlmDomain"    # Ljava/lang/String;

    .prologue
    .line 473
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->ntlmDomain:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 474
    monitor-exit p0

    return-void

    .line 473
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNoopStrict(Z)V
    .registers 3
    .param p1, "noopStrict"    # Z

    .prologue
    .line 605
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->noopStrict:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 606
    monitor-exit p0

    return-void

    .line 605
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setReportSuccess(Z)V
    .registers 3
    .param p1, "reportSuccess"    # Z

    .prologue
    .line 502
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->reportSuccess:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 503
    monitor-exit p0

    return-void

    .line 502
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRequireStartTLS(Z)V
    .registers 3
    .param p1, "requireStartTLS"    # Z

    .prologue
    .line 547
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->requireStartTLS:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 548
    monitor-exit p0

    return-void

    .line 547
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSASLEnabled(Z)V
    .registers 3
    .param p1, "enableSASL"    # Z

    .prologue
    .line 349
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->enableSASL:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 350
    monitor-exit p0

    return-void

    .line 349
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSASLMechanisms([Ljava/lang/String;)V
    .registers 4
    .param p1, "mechanisms"    # [Ljava/lang/String;

    .prologue
    .line 444
    monitor-enter p0

    if-eqz p1, :cond_d

    .line 445
    :try_start_3
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    move-object p1, v0

    .line 446
    :cond_d
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslMechanisms:[Ljava/lang/String;
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_11

    .line 447
    monitor-exit p0

    return-void

    .line 444
    :catchall_11
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setSASLRealm(Ljava/lang/String;)V
    .registers 3
    .param p1, "saslRealm"    # Ljava/lang/String;

    .prologue
    .line 377
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->saslRealm:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 378
    monitor-exit p0

    return-void

    .line 377
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setStartTLS(Z)V
    .registers 3
    .param p1, "useStartTLS"    # Z

    .prologue
    .line 525
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->useStartTLS:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 526
    monitor-exit p0

    return-void

    .line 525
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUseCanonicalHostName(Z)V
    .registers 3
    .param p1, "useCanonicalHostName"    # Z

    .prologue
    .line 400
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->useCanonicalHostName:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 401
    monitor-exit p0

    return-void

    .line 400
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUseRset(Z)V
    .registers 3
    .param p1, "useRset"    # Z

    .prologue
    .line 581
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPTransport;->useRset:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 582
    monitor-exit p0

    return-void

    .line 581
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized simpleCommand(Ljava/lang/String;)I
    .registers 3
    .param p1, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2219
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand(Ljava/lang/String;)V

    .line 2220
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_a

    move-result v0

    monitor-exit p0

    return v0

    .line 2219
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected simpleCommand([B)I
    .registers 3
    .param p1, "cmd"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2233
    sget-boolean v0, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 2234
    :cond_10
    invoke-direct {p0, p1}, Lcom/sun/mail/smtp/SMTPTransport;->sendCommand([B)V

    .line 2235
    invoke-virtual {p0}, Lcom/sun/mail/smtp/SMTPTransport;->readServerResponse()I

    move-result v0

    return v0
.end method

.method protected startTLS()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1992
    const-string v1, "STARTTLS"

    const/16 v2, 0xdc

    invoke-virtual {p0, v1, v2}, Lcom/sun/mail/smtp/SMTPTransport;->issueCommand(Ljava/lang/String;I)V

    .line 1995
    :try_start_7
    iget-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    iget-object v2, p0, Lcom/sun/mail/smtp/SMTPTransport;->host:Ljava/lang/String;

    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->session:Lkorex/mail/Session;

    .line 1996
    invoke-virtual {v3}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mail."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1995
    invoke-static {v1, v2, v3, v4}, Lcom/sun/mail/util/SocketFetcher;->startTLS(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPTransport;->serverSocket:Ljava/net/Socket;

    .line 1997
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->initStreams()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_2f} :catch_30

    .line 2003
    return-void

    .line 1998
    :catch_30
    move-exception v0

    .line 1999
    .local v0, "ioex":Ljava/io/IOException;
    invoke-direct {p0}, Lcom/sun/mail/smtp/SMTPTransport;->closeConnection()V

    .line 2000
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Could not convert socket to TLS"

    invoke-direct {v1, v2, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method protected supportsAuthentication(Ljava/lang/String;)Z
    .registers 9
    .param p1, "auth"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2413
    sget-boolean v5, Lcom/sun/mail/smtp/SMTPTransport;->$assertionsDisabled:Z

    if-nez v5, :cond_12

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_12

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2414
    :cond_12
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    if-nez v5, :cond_17

    .line 2430
    :cond_16
    :goto_16
    return v3

    .line 2416
    :cond_17
    iget-object v5, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    const-string v6, "AUTH"

    invoke-virtual {v5, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2417
    .local v0, "a":Ljava/lang/String;
    if-eqz v0, :cond_16

    .line 2419
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 2420
    .local v1, "st":Ljava/util/StringTokenizer;
    :cond_28
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_3a

    .line 2421
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 2422
    .local v2, "tok":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_28

    move v3, v4

    .line 2423
    goto :goto_16

    .line 2426
    .end local v2    # "tok":Ljava/lang/String;
    :cond_3a
    const-string v5, "LOGIN"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16

    const-string v5, "AUTH=LOGIN"

    invoke-virtual {p0, v5}, Lcom/sun/mail/smtp/SMTPTransport;->supportsExtension(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 2427
    iget-object v3, p0, Lcom/sun/mail/smtp/SMTPTransport;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v5, "use AUTH=LOGIN hack"

    invoke-virtual {v3, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    move v3, v4

    .line 2428
    goto :goto_16
.end method

.method public supportsExtension(Ljava/lang/String;)Z
    .registers 4
    .param p1, "ext"    # Ljava/lang/String;

    .prologue
    .line 2384
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport;->extMap:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2385
    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
