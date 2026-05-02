.class Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;
.super Lkorex/activation/DataHandler;
.source "MimeBodyPart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/MimeBodyPart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MimePartDataHandler"
.end annotation


# instance fields
.field part:Lkorex/mail/internet/MimePart;


# direct methods
.method public constructor <init>(Lkorex/mail/internet/MimePart;)V
    .registers 3
    .param p1, "part"    # Lkorex/mail/internet/MimePart;

    .prologue
    .line 1635
    new-instance v0, Lkorex/mail/internet/MimePartDataSource;

    invoke-direct {v0, p1}, Lkorex/mail/internet/MimePartDataSource;-><init>(Lkorex/mail/internet/MimePart;)V

    invoke-direct {p0, v0}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    .line 1636
    iput-object p1, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    .line 1637
    return-void
.end method


# virtual methods
.method getContentStream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1640
    const/4 v0, 0x0

    .line 1642
    .local v0, "is":Ljava/io/InputStream;
    iget-object v3, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    instance-of v3, v3, Lkorex/mail/internet/MimeBodyPart;

    if-eqz v3, :cond_10

    .line 1643
    iget-object v1, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    check-cast v1, Lkorex/mail/internet/MimeBodyPart;

    .line 1644
    .local v1, "mbp":Lkorex/mail/internet/MimeBodyPart;
    invoke-virtual {v1}, Lkorex/mail/internet/MimeBodyPart;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    .line 1649
    .end local v1    # "mbp":Lkorex/mail/internet/MimeBodyPart;
    :cond_f
    :goto_f
    return-object v0

    .line 1645
    :cond_10
    iget-object v3, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    instance-of v3, v3, Lkorex/mail/internet/MimeMessage;

    if-eqz v3, :cond_f

    .line 1646
    iget-object v2, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    check-cast v2, Lkorex/mail/internet/MimeMessage;

    .line 1647
    .local v2, "msg":Lkorex/mail/internet/MimeMessage;
    invoke-virtual {v2}, Lkorex/mail/internet/MimeMessage;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_f
.end method

.method getPart()Lkorex/mail/internet/MimePart;
    .registers 2

    .prologue
    .line 1653
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;->part:Lkorex/mail/internet/MimePart;

    return-object v0
.end method
