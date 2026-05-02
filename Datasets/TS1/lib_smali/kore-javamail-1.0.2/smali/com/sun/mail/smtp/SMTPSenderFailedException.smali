.class public Lcom/sun/mail/smtp/SMTPSenderFailedException;
.super Lkorex/mail/SendFailedException;
.source "SMTPSenderFailedException.java"


# static fields
.field private static final serialVersionUID:J = 0x72403d150b9bc13L


# instance fields
.field protected addr:Lkorex/mail/internet/InternetAddress;

.field protected cmd:Ljava/lang/String;

.field protected rc:I


# direct methods
.method public constructor <init>(Lkorex/mail/internet/InternetAddress;Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p1, "addr"    # Lkorex/mail/internet/InternetAddress;
    .param p2, "cmd"    # Ljava/lang/String;
    .param p3, "rc"    # I
    .param p4, "err"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0, p4}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;)V

    .line 75
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->addr:Lkorex/mail/internet/InternetAddress;

    .line 76
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->cmd:Ljava/lang/String;

    .line 77
    iput p3, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->rc:I

    .line 78
    return-void
.end method


# virtual methods
.method public getAddress()Lkorex/mail/internet/InternetAddress;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->addr:Lkorex/mail/internet/InternetAddress;

    return-object v0
.end method

.method public getCommand()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->cmd:Ljava/lang/String;

    return-object v0
.end method

.method public getReturnCode()I
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lcom/sun/mail/smtp/SMTPSenderFailedException;->rc:I

    return v0
.end method
