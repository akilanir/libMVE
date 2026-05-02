.class public Lcom/sun/mail/smtp/SMTPAddressSucceededException;
.super Lkorex/mail/MessagingException;
.source "SMTPAddressSucceededException.java"


# static fields
.field private static final serialVersionUID:J = -0x1036c343a388c3adL


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
    .line 75
    invoke-direct {p0, p4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 76
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->addr:Lkorex/mail/internet/InternetAddress;

    .line 77
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->cmd:Ljava/lang/String;

    .line 78
    iput p3, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->rc:I

    .line 79
    return-void
.end method


# virtual methods
.method public getAddress()Lkorex/mail/internet/InternetAddress;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->addr:Lkorex/mail/internet/InternetAddress;

    return-object v0
.end method

.method public getCommand()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->cmd:Ljava/lang/String;

    return-object v0
.end method

.method public getReturnCode()I
    .registers 2

    .prologue
    .line 109
    iget v0, p0, Lcom/sun/mail/smtp/SMTPAddressSucceededException;->rc:I

    return v0
.end method
