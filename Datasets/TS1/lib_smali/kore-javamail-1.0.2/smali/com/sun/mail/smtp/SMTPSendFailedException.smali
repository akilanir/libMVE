.class public Lcom/sun/mail/smtp/SMTPSendFailedException;
.super Lkorex/mail/SendFailedException;
.source "SMTPSendFailedException.java"


# static fields
.field private static final serialVersionUID:J = 0x6fb43a627ef24a1eL


# instance fields
.field protected addr:Lkorex/mail/internet/InternetAddress;

.field protected cmd:Ljava/lang/String;

.field protected rc:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V
    .registers 14
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "rc"    # I
    .param p3, "err"    # Ljava/lang/String;
    .param p4, "ex"    # Ljava/lang/Exception;
    .param p5, "vs"    # [Lkorex/mail/Address;
    .param p6, "vus"    # [Lkorex/mail/Address;
    .param p7, "inv"    # [Lkorex/mail/Address;

    .prologue
    .line 82
    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V

    .line 83
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPSendFailedException;->cmd:Ljava/lang/String;

    .line 84
    iput p2, p0, Lcom/sun/mail/smtp/SMTPSendFailedException;->rc:I

    .line 85
    return-void
.end method


# virtual methods
.method public getCommand()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPSendFailedException;->cmd:Ljava/lang/String;

    return-object v0
.end method

.method public getReturnCode()I
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lcom/sun/mail/smtp/SMTPSendFailedException;->rc:I

    return v0
.end method
