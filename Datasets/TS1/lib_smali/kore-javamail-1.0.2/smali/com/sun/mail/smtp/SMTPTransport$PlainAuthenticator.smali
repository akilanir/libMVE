.class Lcom/sun/mail/smtp/SMTPTransport$PlainAuthenticator;
.super Lcom/sun/mail/smtp/SMTPTransport$Authenticator;
.source "SMTPTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/smtp/SMTPTransport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlainAuthenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/mail/smtp/SMTPTransport;


# direct methods
.method constructor <init>(Lcom/sun/mail/smtp/SMTPTransport;)V
    .registers 3

    .prologue
    .line 939
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPTransport$PlainAuthenticator;->this$0:Lcom/sun/mail/smtp/SMTPTransport;

    .line 940
    const-string v0, "PLAIN"

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/smtp/SMTPTransport$Authenticator;-><init>(Lcom/sun/mail/smtp/SMTPTransport;Ljava/lang/String;)V

    .line 941
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
    .line 963
    new-instance v0, Lkorex/mail/AuthenticationFailedException;

    const-string v1, "PLAIN asked for more"

    invoke-direct {v0, v1}, Lkorex/mail/AuthenticationFailedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getInitialResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
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
    const/4 v3, 0x0

    .line 946
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 947
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v0, Lcom/sun/mail/util/BASE64EncoderStream;

    const v2, 0x7fffffff

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/BASE64EncoderStream;-><init>(Ljava/io/OutputStream;I)V

    .line 949
    .local v0, "b64os":Ljava/io/OutputStream;
    if-eqz p2, :cond_17

    .line 950
    invoke-static {p2}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 951
    :cond_17
    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 952
    invoke-static {p3}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 953
    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    .line 954
    invoke-static {p4}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 955
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 957
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/util/ASCIIUtility;->toString([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
