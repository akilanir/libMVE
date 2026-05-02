.class public Lcom/sun/mail/smtp/SMTPMessage;
.super Lkorex/mail/internet/MimeMessage;
.source "SMTPMessage.java"


# static fields
.field public static final NOTIFY_DELAY:I = 0x4

.field public static final NOTIFY_FAILURE:I = 0x2

.field public static final NOTIFY_NEVER:I = -0x1

.field public static final NOTIFY_SUCCESS:I = 0x1

.field public static final RETURN_FULL:I = 0x1

.field public static final RETURN_HDRS:I = 0x2

.field private static final returnOptionString:[Ljava/lang/String;


# instance fields
.field private allow8bitMIME:Z

.field private envelopeFrom:Ljava/lang/String;

.field private extension:Ljava/lang/String;

.field private notifyOptions:I

.field private returnOption:I

.field private sendPartial:Z

.field private submitter:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 78
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "FULL"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "HDRS"

    aput-object v2, v0, v1

    sput-object v0, Lcom/sun/mail/smtp/SMTPMessage;->returnOptionString:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lkorex/mail/Session;)V
    .registers 4
    .param p1, "session"    # Lkorex/mail/Session;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 81
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    .line 82
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    .line 83
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->sendPartial:Z

    .line 84
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->allow8bitMIME:Z

    .line 85
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->submitter:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->extension:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Session;Ljava/io/InputStream;)V
    .registers 5
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 112
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;Ljava/io/InputStream;)V

    .line 81
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    .line 82
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    .line 83
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->sendPartial:Z

    .line 84
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->allow8bitMIME:Z

    .line 85
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->submitter:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->extension:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public constructor <init>(Lkorex/mail/internet/MimeMessage;)V
    .registers 4
    .param p1, "source"    # Lkorex/mail/internet/MimeMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 127
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/internet/MimeMessage;)V

    .line 81
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    .line 82
    iput v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    .line 83
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->sendPartial:Z

    .line 84
    iput-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->allow8bitMIME:Z

    .line 85
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->submitter:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->extension:Ljava/lang/String;

    .line 128
    return-void
.end method


# virtual methods
.method public getAllow8bitMIME()Z
    .registers 2

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->allow8bitMIME:Z

    return v0
.end method

.method getDSNNotify()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x2c

    .line 186
    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    if-nez v1, :cond_8

    .line 187
    const/4 v1, 0x0

    .line 203
    :goto_7
    return-object v1

    .line 188
    :cond_8
    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_10

    .line 189
    const-string v1, "NEVER"

    goto :goto_7

    .line 190
    :cond_10
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 191
    .local v0, "sb":Ljava/lang/StringBuffer;
    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_20

    .line 192
    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    :cond_20
    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_34

    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-eqz v1, :cond_2f

    .line 195
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 196
    :cond_2f
    const-string v1, "FAILURE"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 198
    :cond_34
    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_48

    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-eqz v1, :cond_43

    .line 200
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 201
    :cond_43
    const-string v1, "DELAY"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 203
    :cond_48
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method getDSNRet()Ljava/lang/String;
    .registers 3

    .prologue
    .line 236
    sget-object v0, Lcom/sun/mail/smtp/SMTPMessage;->returnOptionString:[Ljava/lang/String;

    iget v1, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getEnvelopeFrom()Ljava/lang/String;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->envelopeFrom:Ljava/lang/String;

    return-object v0
.end method

.method public getMailExtension()Ljava/lang/String;
    .registers 2

    .prologue
    .line 318
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->extension:Ljava/lang/String;

    return-object v0
.end method

.method public getNotifyOptions()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    return v0
.end method

.method public getReturnOption()I
    .registers 2

    .prologue
    .line 228
    iget v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    return v0
.end method

.method public getSendPartial()Z
    .registers 2

    .prologue
    .line 283
    iget-boolean v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->sendPartial:Z

    return v0
.end method

.method public getSubmitter()Ljava/lang/String;
    .registers 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/sun/mail/smtp/SMTPMessage;->submitter:Ljava/lang/String;

    return-object v0
.end method

.method public setAllow8bitMIME(Z)V
    .registers 2
    .param p1, "allow"    # Z

    .prologue
    .line 250
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->allow8bitMIME:Z

    .line 251
    return-void
.end method

.method public setEnvelopeFrom(Ljava/lang/String;)V
    .registers 2
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->envelopeFrom:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setMailExtension(Ljava/lang/String;)V
    .registers 2
    .param p1, "extension"    # Ljava/lang/String;

    .prologue
    .line 344
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->extension:Ljava/lang/String;

    .line 345
    return-void
.end method

.method public setNotifyOptions(I)V
    .registers 4
    .param p1, "options"    # I

    .prologue
    .line 167
    const/4 v0, -0x1

    if-lt p1, v0, :cond_7

    const/16 v0, 0x8

    if-lt p1, v0, :cond_f

    .line 168
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad return option"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_f
    iput p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->notifyOptions:I

    .line 170
    return-void
.end method

.method public setReturnOption(I)V
    .registers 4
    .param p1, "option"    # I

    .prologue
    .line 217
    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_d

    .line 218
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bad return option"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_d
    iput p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->returnOption:I

    .line 220
    return-void
.end method

.method public setSendPartial(Z)V
    .registers 2
    .param p1, "partial"    # Z

    .prologue
    .line 274
    iput-boolean p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->sendPartial:Z

    .line 275
    return-void
.end method

.method public setSubmitter(Ljava/lang/String;)V
    .registers 2
    .param p1, "submitter"    # Ljava/lang/String;

    .prologue
    .line 307
    iput-object p1, p0, Lcom/sun/mail/smtp/SMTPMessage;->submitter:Ljava/lang/String;

    .line 308
    return-void
.end method
