.class public Lcom/sun/mail/smtp/SMTPAddressFailedException;
.super Lkorex/mail/SendFailedException;
.source "SMTPAddressFailedException.java"


# static fields
.field private static final serialVersionUID:J = 0xb2b55b6465c5351L


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
    .line 76
    invoke-direct {p0, p4}, Lkorex/mail/SendFailedException;-><init>(Ljava/lang/String;)V

    .line 77
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->addr:Lkorex/mail/internet/InternetAddress;

    .line 78
    iput-object p2, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->cmd:Ljava/lang/String;

    .line 79
    iput p3, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->rc:I

    .line 80
    return-void
.end method


# virtual methods
.method public getAddress()Lkorex/mail/internet/InternetAddress;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->addr:Lkorex/mail/internet/InternetAddress;

    return-object v0
.end method

.method public getCommand()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->cmd:Ljava/lang/String;

    return-object v0
.end method

.method public getReturnCode()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/sun/mail/smtp/SMTPAddressFailedException;->rc:I

    return v0
.end method
