.class Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;
.super Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/smtp/SMTPTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginAuthenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPTransport;


# direct methods
.method constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 3

    .prologue
    .line 918
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 919
    const-string v0, "LOGIN"

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;)V

    .line 920
    return-void
.end method


# virtual methods
.method doAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "authzid"    # Ljava/lang/String;
    .param p3, "user"    # Ljava/lang/String;
    .param p4, "passwd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 925
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 926
    invoke-static {p3}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v1

    .line 925
    invoke-virtual {v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand([B)I

    move-result v0

    iput v0, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->resp:I

    .line 927
    iget v0, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->resp:I

    const/16 v1, 0x14e

    if-ne v0, v1, :cond_26

    .line 929
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 930
    invoke-static {p4}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v1

    .line 929
    invoke-virtual {v0, v1}, Lcom/sun/mail/smtp/SMTPTransport;->simpleCommand([B)I

    move-result v0

    iput v0, p0, Lcom/sun/mail/smtp/SMTPTransport$LoginAuthenticator;->resp:I

    .line 932
    :cond_26
    return-void
.end method
