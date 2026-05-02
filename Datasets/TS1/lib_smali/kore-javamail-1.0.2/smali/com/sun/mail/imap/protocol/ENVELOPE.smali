.class public Lcom/sun/mail/imap/protocol/ENVELOPE;
.super Ljava/lang/Object;
.source "ENVELOPE.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field private static mailDateFormat:Lkorex/mail/internet/MailDateFormat;

.field static final name:[C


# instance fields
.field public bcc:[Lkorex/mail/internet/InternetAddress;

.field public cc:[Lkorex/mail/internet/InternetAddress;

.field public date:Ljava/util/Date;

.field public from:[Lkorex/mail/internet/InternetAddress;

.field public inReplyTo:Ljava/lang/String;

.field public messageId:Ljava/lang/String;

.field public msgno:I

.field public replyTo:[Lkorex/mail/internet/InternetAddress;

.field public sender:[Lkorex/mail/internet/InternetAddress;

.field public subject:Ljava/lang/String;

.field public to:[Lkorex/mail/internet/InternetAddress;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    const/16 v0, 0x8

    new-array v0, v0, [C

    fill-array-data v0, :array_12

    sput-object v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->name:[C

    .line 81
    new-instance v0, Lkorex/mail/internet/MailDateFormat;

    invoke-direct {v0}, Lkorex/mail/internet/MailDateFormat;-><init>()V

    sput-object v0, Lcom/sun/mail/imap/protocol/ENVELOPE;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    return-void

    .line 66
    nop

    :array_12
    .array-data 2
        0x45s
        0x4es
        0x56s
        0x45s
        0x4cs
        0x4fs
        0x50s
        0x45s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 5
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->date:Ljava/util/Date;

    .line 84
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v1

    iput v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->msgno:I

    .line 86
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 88
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v1

    const/16 v2, 0x28

    if-eq v1, v2, :cond_1f

    .line 89
    new-instance v1, Lcom/sun/mail/iap/ParsingException;

    const-string v2, "ENVELOPE parse error"

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :cond_1f
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_2d

    .line 94
    :try_start_25
    sget-object v1, Lcom/sun/mail/imap/protocol/ENVELOPE;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    invoke-virtual {v1, v0}, Lkorex/mail/internet/MailDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->date:Ljava/util/Date;
    :try_end_2d
    .catch Ljava/text/ParseException; {:try_start_25 .. :try_end_2d} :catch_76
    .catch Ljava/lang/RuntimeException; {:try_start_25 .. :try_end_2d} :catch_74

    .line 104
    :cond_2d
    :goto_2d
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->subject:Ljava/lang/String;

    .line 105
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->from:[Lkorex/mail/internet/InternetAddress;

    .line 106
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->sender:[Lkorex/mail/internet/InternetAddress;

    .line 107
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->replyTo:[Lkorex/mail/internet/InternetAddress;

    .line 108
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->to:[Lkorex/mail/internet/InternetAddress;

    .line 109
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->cc:[Lkorex/mail/internet/InternetAddress;

    .line 110
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/ENVELOPE;->parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->bcc:[Lkorex/mail/internet/InternetAddress;

    .line 111
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->inReplyTo:Ljava/lang/String;

    .line 112
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/imap/protocol/ENVELOPE;->messageId:Ljava/lang/String;

    .line 114
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v1

    const/16 v2, 0x29

    if-eq v1, v2, :cond_73

    .line 115
    new-instance v1, Lcom/sun/mail/iap/ParsingException;

    const-string v2, "ENVELOPE parse error"

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_73
    return-void

    .line 96
    :catch_74
    move-exception v1

    goto :goto_2d

    .line 95
    :catch_76
    move-exception v1

    goto :goto_2d
.end method

.method private parseAddressList(Lcom/sun/mail/iap/Response;)[Lkorex/mail/internet/InternetAddress;
    .registers 9
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/16 v6, 0x29

    const/4 v5, 0x1

    .line 120
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 122
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v1

    .line 123
    .local v1, "b":B
    const/16 v4, 0x28

    if-ne v1, v4, :cond_42

    .line 129
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v4

    if-ne v4, v6, :cond_19

    .line 130
    invoke-virtual {p1, v5}, Lcom/sun/mail/iap/Response;->skip(I)V

    .line 149
    :goto_18
    return-object v3

    .line 134
    :cond_19
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v2, "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/internet/InternetAddress;>;"
    :cond_1e
    new-instance v0, Lcom/sun/mail/imap/protocol/IMAPAddress;

    invoke-direct {v0, p1}, Lcom/sun/mail/imap/protocol/IMAPAddress;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 139
    .local v0, "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPAddress;->isEndOfGroup()Z

    move-result v3

    if-nez v3, :cond_2c

    .line 140
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    :cond_2c
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v3

    if-ne v3, v6, :cond_1e

    .line 144
    invoke-virtual {p1, v5}, Lcom/sun/mail/iap/Response;->skip(I)V

    .line 146
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lkorex/mail/internet/InternetAddress;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lkorex/mail/internet/InternetAddress;

    goto :goto_18

    .line 147
    .end local v0    # "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    .end local v2    # "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/internet/InternetAddress;>;"
    :cond_42
    const/16 v4, 0x4e

    if-eq v1, v4, :cond_4a

    const/16 v4, 0x6e

    if-ne v1, v4, :cond_4f

    .line 148
    :cond_4a
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Lcom/sun/mail/iap/Response;->skip(I)V

    goto :goto_18

    .line 151
    :cond_4f
    new-instance v3, Lcom/sun/mail/iap/ParsingException;

    const-string v4, "ADDRESS parse error"

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
