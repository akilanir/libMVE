.class public abstract Lkorex/mail/Authenticator;
.super Ljava/lang/Object;
.source "Authenticator.java"


# instance fields
.field private requestingPort:I

.field private requestingPrompt:Ljava/lang/String;

.field private requestingProtocol:Ljava/lang/String;

.field private requestingSite:Ljava/net/InetAddress;

.field private requestingUserName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 84
    iput-object v1, p0, Lkorex/mail/Authenticator;->requestingSite:Ljava/net/InetAddress;

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/Authenticator;->requestingPort:I

    .line 86
    iput-object v1, p0, Lkorex/mail/Authenticator;->requestingProtocol:Ljava/lang/String;

    .line 87
    iput-object v1, p0, Lkorex/mail/Authenticator;->requestingPrompt:Ljava/lang/String;

    .line 88
    iput-object v1, p0, Lkorex/mail/Authenticator;->requestingUserName:Ljava/lang/String;

    .line 89
    return-void
.end method


# virtual methods
.method protected final getDefaultUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lkorex/mail/Authenticator;->requestingUserName:Ljava/lang/String;

    return-object v0
.end method

.method protected getPasswordAuthentication()Lkorex/mail/PasswordAuthentication;
    .registers 2

    .prologue
    .line 170
    const/4 v0, 0x0

    return-object v0
.end method

.method protected final getRequestingPort()I
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lkorex/mail/Authenticator;->requestingPort:I

    return v0
.end method

.method protected final getRequestingPrompt()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lkorex/mail/Authenticator;->requestingPrompt:Ljava/lang/String;

    return-object v0
.end method

.method protected final getRequestingProtocol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lkorex/mail/Authenticator;->requestingProtocol:Ljava/lang/String;

    return-object v0
.end method

.method protected final getRequestingSite()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lkorex/mail/Authenticator;->requestingSite:Ljava/net/InetAddress;

    return-object v0
.end method

.method final requestPasswordAuthentication(Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lkorex/mail/PasswordAuthentication;
    .registers 7
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "protocol"    # Ljava/lang/String;
    .param p4, "prompt"    # Ljava/lang/String;
    .param p5, "defaultUserName"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-direct {p0}, Lkorex/mail/Authenticator;->reset()V

    .line 109
    iput-object p1, p0, Lkorex/mail/Authenticator;->requestingSite:Ljava/net/InetAddress;

    .line 110
    iput p2, p0, Lkorex/mail/Authenticator;->requestingPort:I

    .line 111
    iput-object p3, p0, Lkorex/mail/Authenticator;->requestingProtocol:Ljava/lang/String;

    .line 112
    iput-object p4, p0, Lkorex/mail/Authenticator;->requestingPrompt:Ljava/lang/String;

    .line 113
    iput-object p5, p0, Lkorex/mail/Authenticator;->requestingUserName:Ljava/lang/String;

    .line 114
    invoke-virtual {p0}, Lkorex/mail/Authenticator;->getPasswordAuthentication()Lkorex/mail/PasswordAuthentication;

    move-result-object v0

    return-object v0
.end method
