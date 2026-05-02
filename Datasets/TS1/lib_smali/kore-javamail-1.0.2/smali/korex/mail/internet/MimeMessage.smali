.class public Lkorex/mail/internet/MimeMessage;
.super Lkorex/mail/Message;
.source "MimeMessage.java"

# interfaces
.implements Lkorex/mail/internet/MimePart;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/internet/MimeMessage$RecipientType;
    }
.end annotation


# static fields
.field private static final answeredFlag:Lkorex/mail/Flags;

.field private static final mailDateFormat:Lkorex/mail/internet/MailDateFormat;


# instance fields
.field protected cachedContent:Ljava/lang/Object;

.field protected content:[B

.field protected contentStream:Ljava/io/InputStream;

.field protected dh:Lkorex/activation/DataHandler;

.field protected flags:Lkorex/mail/Flags;

.field protected headers:Lkorex/mail/internet/InternetHeaders;

.field protected modified:Z

.field protected saved:Z

.field private strict:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 180
    new-instance v0, Lkorex/mail/internet/MailDateFormat;

    invoke-direct {v0}, Lkorex/mail/internet/MailDateFormat;-><init>()V

    sput-object v0, Lkorex/mail/internet/MimeMessage;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    .line 1761
    new-instance v0, Lkorex/mail/Flags;

    sget-object v1, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    invoke-direct {v0, v1}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags$Flag;)V

    sput-object v0, Lkorex/mail/internet/MimeMessage;->answeredFlag:Lkorex/mail/Flags;

    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Folder;I)V
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "msgnum"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 272
    invoke-direct {p0, p1, p2}, Lkorex/mail/Message;-><init>(Lkorex/mail/Folder;I)V

    .line 150
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 163
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 183
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 273
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0}, Lkorex/mail/Flags;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    .line 274
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 275
    invoke-direct {p0}, Lkorex/mail/internet/MimeMessage;->initStrict()V

    .line 276
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Folder;Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "msgnum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 293
    invoke-direct {p0, p1, p3}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Folder;I)V

    .line 294
    invoke-direct {p0}, Lkorex/mail/internet/MimeMessage;->initStrict()V

    .line 295
    invoke-virtual {p0, p2}, Lkorex/mail/internet/MimeMessage;->parse(Ljava/io/InputStream;)V

    .line 296
    return-void
.end method

.method protected constructor <init>(Lkorex/mail/Folder;Lkorex/mail/internet/InternetHeaders;[BI)V
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "headers"    # Lkorex/mail/internet/InternetHeaders;
    .param p3, "content"    # [B
    .param p4, "msgnum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-direct {p0, p1, p4}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Folder;I)V

    .line 313
    iput-object p2, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 314
    iput-object p3, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    .line 315
    invoke-direct {p0}, Lkorex/mail/internet/MimeMessage;->initStrict()V

    .line 316
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Session;)V
    .registers 4
    .param p1, "session"    # Lkorex/mail/Session;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 194
    invoke-direct {p0, p1}, Lkorex/mail/Message;-><init>(Lkorex/mail/Session;)V

    .line 150
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 163
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 183
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 195
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 196
    new-instance v0, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v0}, Lkorex/mail/internet/InternetHeaders;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 197
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0}, Lkorex/mail/Flags;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    .line 198
    invoke-direct {p0}, Lkorex/mail/internet/MimeMessage;->initStrict()V

    .line 199
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
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 216
    invoke-direct {p0, p1}, Lkorex/mail/Message;-><init>(Lkorex/mail/Session;)V

    .line 150
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 163
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 183
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 217
    new-instance v0, Lkorex/mail/Flags;

    invoke-direct {v0}, Lkorex/mail/Flags;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    .line 218
    invoke-direct {p0}, Lkorex/mail/internet/MimeMessage;->initStrict()V

    .line 219
    invoke-virtual {p0, p2}, Lkorex/mail/internet/MimeMessage;->parse(Ljava/io/InputStream;)V

    .line 220
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 221
    return-void
.end method

.method public constructor <init>(Lkorex/mail/internet/MimeMessage;)V
    .registers 9
    .param p1, "source"    # Lkorex/mail/internet/MimeMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 236
    iget-object v4, p1, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    invoke-direct {p0, v4}, Lkorex/mail/Message;-><init>(Lkorex/mail/Session;)V

    .line 150
    iput-boolean v5, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 163
    iput-boolean v5, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 183
    iput-boolean v6, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 237
    invoke-virtual {p1}, Lkorex/mail/internet/MimeMessage;->getFlags()Lkorex/mail/Flags;

    move-result-object v4

    iput-object v4, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    .line 238
    iget-object v4, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    if-nez v4, :cond_1e

    .line 239
    new-instance v4, Lkorex/mail/Flags;

    invoke-direct {v4}, Lkorex/mail/Flags;-><init>()V

    iput-object v4, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    .line 241
    :cond_1e
    invoke-virtual {p1}, Lkorex/mail/internet/MimeMessage;->getSize()I

    move-result v3

    .line 242
    .local v3, "size":I
    if-lez v3, :cond_46

    .line 243
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 247
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    :goto_29
    :try_start_29
    iget-boolean v4, p1, Lkorex/mail/internet/MimeMessage;->strict:Z

    iput-boolean v4, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 248
    invoke-virtual {p1, v1}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;)V

    .line 249
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 250
    new-instance v0, Lkorex/mail/util/SharedByteArrayInputStream;

    .line 251
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v0, v4}, Lkorex/mail/util/SharedByteArrayInputStream;-><init>([B)V

    .line 252
    .local v0, "bis":Lkorex/mail/util/SharedByteArrayInputStream;
    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->parse(Ljava/io/InputStream;)V

    .line 253
    invoke-virtual {v0}, Lkorex/mail/util/SharedByteArrayInputStream;->close()V

    .line 254
    const/4 v4, 0x1

    iput-boolean v4, p0, Lkorex/mail/internet/MimeMessage;->saved:Z
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_45} :catch_4c

    .line 260
    return-void

    .line 245
    .end local v0    # "bis":Lkorex/mail/util/SharedByteArrayInputStream;
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    :cond_46
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .restart local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    goto :goto_29

    .line 255
    :catch_4c
    move-exception v2

    .line 257
    .local v2, "ex":Ljava/io/IOException;
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "IOException while copying message"

    invoke-direct {v4, v5, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v4
.end method

.method private addAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 751
    if-eqz p2, :cond_6

    array-length v3, p2

    if-nez v3, :cond_7

    .line 766
    :cond_6
    :goto_6
    return-void

    .line 753
    :cond_7
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v0

    .line 755
    .local v0, "a":[Lkorex/mail/Address;
    if-eqz v0, :cond_10

    array-length v3, v0

    if-nez v3, :cond_21

    .line 756
    :cond_10
    move-object v1, p2

    .line 762
    .local v1, "anew":[Lkorex/mail/Address;
    :goto_11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    invoke-static {v1, v3}, Lkorex/mail/internet/InternetAddress;->toString([Lkorex/mail/Address;I)Ljava/lang/String;

    move-result-object v2

    .line 763
    .local v2, "s":Ljava/lang/String;
    if-eqz v2, :cond_6

    .line 765
    invoke-virtual {p0, p1, v2}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 758
    .end local v1    # "anew":[Lkorex/mail/Address;
    .end local v2    # "s":Ljava/lang/String;
    :cond_21
    array-length v3, v0

    array-length v4, p2

    add-int/2addr v3, v4

    new-array v1, v3, [Lkorex/mail/Address;

    .line 759
    .restart local v1    # "anew":[Lkorex/mail/Address;
    array-length v3, v0

    invoke-static {v0, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 760
    array-length v3, v0

    array-length v4, p2

    invoke-static {p2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_11
.end method

.method private eliminateDuplicates(Ljava/util/Vector;[Lkorex/mail/Address;)[Lkorex/mail/Address;
    .registers 12
    .param p1, "v"    # Ljava/util/Vector;
    .param p2, "addrs"    # [Lkorex/mail/Address;

    .prologue
    const/4 v7, 0x0

    .line 1769
    if-nez p2, :cond_5

    move-object v6, v7

    .line 1801
    :goto_4
    return-object v6

    .line 1771
    :cond_5
    const/4 v2, 0x0

    .line 1772
    .local v2, "gone":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    array-length v6, p2

    if-ge v3, v6, :cond_32

    .line 1773
    const/4 v1, 0x0

    .line 1775
    .local v1, "found":Z
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_c
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v4, v6, :cond_25

    .line 1776
    invoke-virtual {p1, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkorex/mail/internet/InternetAddress;

    aget-object v8, p2, v3

    invoke-virtual {v6, v8}, Lkorex/mail/internet/InternetAddress;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2f

    .line 1778
    const/4 v1, 0x1

    .line 1779
    add-int/lit8 v2, v2, 0x1

    .line 1780
    aput-object v7, p2, v3

    .line 1784
    :cond_25
    if-nez v1, :cond_2c

    .line 1785
    aget-object v6, p2, v3

    invoke-virtual {p1, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1772
    :cond_2c
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 1775
    :cond_2f
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 1788
    .end local v1    # "found":Z
    .end local v4    # "j":I
    :cond_32
    if-eqz v2, :cond_55

    .line 1792
    instance-of v6, p2, [Lkorex/mail/internet/InternetAddress;

    if-eqz v6, :cond_4f

    .line 1793
    array-length v6, p2

    sub-int/2addr v6, v2

    new-array v0, v6, [Lkorex/mail/internet/InternetAddress;

    .line 1796
    .local v0, "a":[Lkorex/mail/Address;
    :goto_3c
    const/4 v3, 0x0

    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_3e
    array-length v6, p2

    if-ge v3, v6, :cond_54

    .line 1797
    aget-object v6, p2, v3

    if-eqz v6, :cond_4c

    .line 1798
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "j":I
    .local v5, "j":I
    aget-object v6, p2, v3

    aput-object v6, v0, v4

    move v4, v5

    .line 1796
    .end local v5    # "j":I
    .restart local v4    # "j":I
    :cond_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_3e

    .line 1795
    .end local v0    # "a":[Lkorex/mail/Address;
    .end local v4    # "j":I
    :cond_4f
    array-length v6, p2

    sub-int/2addr v6, v2

    new-array v0, v6, [Lkorex/mail/Address;

    .restart local v0    # "a":[Lkorex/mail/Address;
    goto :goto_3c

    .line 1799
    .restart local v4    # "j":I
    :cond_54
    move-object p2, v0

    .end local v0    # "a":[Lkorex/mail/Address;
    .end local v4    # "j":I
    :cond_55
    move-object v6, p2

    .line 1801
    goto :goto_4
.end method

.method private getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 735
    const-string v1, ","

    invoke-virtual {p0, p1, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 736
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    iget-boolean v1, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    invoke-static {v0, v1}, Lkorex/mail/internet/InternetAddress;->parseHeader(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    goto :goto_9
.end method

.method private getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1314
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_7

    .line 1315
    const-string v0, "To"

    .line 1324
    .local v0, "headerName":Ljava/lang/String;
    :goto_6
    return-object v0

    .line 1316
    .end local v0    # "headerName":Ljava/lang/String;
    :cond_7
    sget-object v1, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_e

    .line 1317
    const-string v0, "Cc"

    .restart local v0    # "headerName":Ljava/lang/String;
    goto :goto_6

    .line 1318
    .end local v0    # "headerName":Ljava/lang/String;
    :cond_e
    sget-object v1, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    if-ne p1, v1, :cond_15

    .line 1319
    const-string v0, "Bcc"

    .restart local v0    # "headerName":Ljava/lang/String;
    goto :goto_6

    .line 1320
    .end local v0    # "headerName":Ljava/lang/String;
    :cond_15
    sget-object v1, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v1, :cond_1c

    .line 1321
    const-string v0, "Newsgroups"

    .restart local v0    # "headerName":Ljava/lang/String;
    goto :goto_6

    .line 1323
    .end local v0    # "headerName":Ljava/lang/String;
    :cond_1c
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Invalid Recipient Type"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private initStrict()V
    .registers 4

    .prologue
    .line 322
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    if-eqz v0, :cond_f

    .line 323
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    const-string v1, "mail.mime.address.strict"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->strict:Z

    .line 325
    :cond_f
    return-void
.end method

.method private setAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 742
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    invoke-static {p2, v1}, Lkorex/mail/internet/InternetAddress;->toString([Lkorex/mail/Address;I)Ljava/lang/String;

    move-result-object v0

    .line 743
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_10

    .line 744
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 747
    :goto_f
    return-void

    .line 746
    :cond_10
    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f
.end method


# virtual methods
.method public addFrom([Lkorex/mail/Address;)V
    .registers 3
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 462
    const-string v0, "From"

    invoke-direct {p0, v0, p1}, Lkorex/mail/internet/MimeMessage;->addAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    .line 463
    return-void
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1962
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1963
    return-void
.end method

.method public addHeaderLine(Ljava/lang/String;)V
    .registers 3
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2031
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->addHeaderLine(Ljava/lang/String;)V

    .line 2032
    return-void
.end method

.method public addRecipients(Lkorex/mail/Message$RecipientType;Ljava/lang/String;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 692
    sget-object v0, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v0, :cond_12

    .line 693
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_11

    .line 694
    const-string v0, "Newsgroups"

    invoke-virtual {p0, v0, p2}, Lkorex/mail/internet/MimeMessage;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 697
    :cond_11
    :goto_11
    return-void

    .line 696
    :cond_12
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->addAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    goto :goto_11
.end method

.method public addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 667
    sget-object v1, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v1, :cond_10

    .line 668
    invoke-static {p2}, Lkorex/mail/internet/NewsAddress;->toString([Lkorex/mail/Address;)Ljava/lang/String;

    move-result-object v0

    .line 669
    .local v0, "s":Ljava/lang/String;
    if-eqz v0, :cond_f

    .line 670
    const-string v1, "Newsgroups"

    invoke-virtual {p0, v1, v0}, Lkorex/mail/internet/MimeMessage;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    .end local v0    # "s":Ljava/lang/String;
    :cond_f
    :goto_f
    return-void

    .line 672
    :cond_10
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lkorex/mail/internet/MimeMessage;->addAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    goto :goto_f
.end method

.method protected createInternetHeaders(Ljava/io/InputStream;)Lkorex/mail/internet/InternetHeaders;
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2224
    new-instance v0, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v0, p1}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method protected createMimeMessage(Lkorex/mail/Session;)Lkorex/mail/internet/MimeMessage;
    .registers 3
    .param p1, "session"    # Lkorex/mail/Session;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2241
    new-instance v0, Lkorex/mail/internet/MimeMessage;

    invoke-direct {v0, p1}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    return-object v0
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2042
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeaders()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1994
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaders()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllRecipients()[Lkorex/mail/Address;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 583
    invoke-super {p0}, Lkorex/mail/Message;->getAllRecipients()[Lkorex/mail/Address;

    move-result-object v1

    .line 584
    .local v1, "all":[Lkorex/mail/Address;
    sget-object v3, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    invoke-virtual {p0, v3}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v2

    .line 586
    .local v2, "ng":[Lkorex/mail/Address;
    if-nez v2, :cond_e

    .line 594
    .end local v1    # "all":[Lkorex/mail/Address;
    :goto_d
    return-object v1

    .line 588
    .restart local v1    # "all":[Lkorex/mail/Address;
    :cond_e
    if-nez v1, :cond_12

    move-object v1, v2

    .line 589
    goto :goto_d

    .line 591
    :cond_12
    array-length v3, v1

    array-length v4, v2

    add-int/2addr v3, v4

    new-array v0, v3, [Lkorex/mail/Address;

    .line 592
    .local v0, "addresses":[Lkorex/mail/Address;
    array-length v3, v1

    invoke-static {v1, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 593
    array-length v3, v1

    array-length v4, v2

    invoke-static {v2, v5, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v0

    .line 594
    goto :goto_d
.end method

.method public getContent()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1452
    iget-object v3, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    if-eqz v3, :cond_7

    .line 1453
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    .line 1473
    :cond_6
    :goto_6
    return-object v0

    .line 1456
    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v3

    invoke-virtual {v3}, Lkorex/activation/DataHandler;->getContent()Ljava/lang/Object;
    :try_end_e
    .catch Lcom/sun/mail/util/FolderClosedIOException; {:try_start_7 .. :try_end_e} :catch_30
    .catch Lcom/sun/mail/util/MessageRemovedIOException; {:try_start_7 .. :try_end_e} :catch_3f

    move-result-object v0

    .line 1462
    .local v0, "c":Ljava/lang/Object;
    sget-boolean v3, Lkorex/mail/internet/MimeBodyPart;->cacheMultipart:Z

    if-eqz v3, :cond_6

    instance-of v3, v0, Lkorex/mail/Multipart;

    if-nez v3, :cond_1b

    instance-of v3, v0, Lkorex/mail/Message;

    if-eqz v3, :cond_6

    :cond_1b
    iget-object v3, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    if-nez v3, :cond_23

    iget-object v3, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    if-eqz v3, :cond_6

    .line 1465
    :cond_23
    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    .line 1470
    instance-of v3, v0, Lkorex/mail/internet/MimeMultipart;

    if-eqz v3, :cond_6

    move-object v3, v0

    .line 1471
    check-cast v3, Lkorex/mail/internet/MimeMultipart;

    invoke-virtual {v3}, Lkorex/mail/internet/MimeMultipart;->parse()V

    goto :goto_6

    .line 1457
    .end local v0    # "c":Ljava/lang/Object;
    :catch_30
    move-exception v1

    .line 1458
    .local v1, "fex":Lcom/sun/mail/util/FolderClosedIOException;
    new-instance v3, Lkorex/mail/FolderClosedException;

    invoke-virtual {v1}, Lcom/sun/mail/util/FolderClosedIOException;->getFolder()Lkorex/mail/Folder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/sun/mail/util/FolderClosedIOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v3

    .line 1459
    .end local v1    # "fex":Lcom/sun/mail/util/FolderClosedIOException;
    :catch_3f
    move-exception v2

    .line 1460
    .local v2, "mex":Lcom/sun/mail/util/MessageRemovedIOException;
    new-instance v3, Lkorex/mail/MessageRemovedException;

    invoke-virtual {v2}, Lcom/sun/mail/util/MessageRemovedIOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getContentID()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1082
    const-string v0, "Content-Id"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLanguage()[Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1225
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getContentLanguage(Lkorex/mail/internet/MimePart;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentMD5()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1116
    const-string v0, "Content-MD5"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getContentStream()Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1364
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    if-eqz v0, :cond_11

    .line 1365
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    const-wide/16 v1, 0x0

    const-wide/16 v3, -0x1

    invoke-interface {v0, v1, v2, v3, v4}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v0

    .line 1367
    :goto_10
    return-object v0

    .line 1366
    :cond_11
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    if-eqz v0, :cond_1d

    .line 1367
    new-instance v0, Lkorex/mail/util/SharedByteArrayInputStream;

    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    invoke-direct {v0, v1}, Lkorex/mail/util/SharedByteArrayInputStream;-><init>([B)V

    goto :goto_10

    .line 1369
    :cond_1d
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "No MimeMessage content"

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 992
    const-string v1, "Content-Type"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 993
    .local v0, "s":Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/sun/mail/util/MimeUtil;->cleanContentType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 994
    if-nez v0, :cond_f

    .line 995
    const-string v0, "text/plain"

    .line 996
    .end local v0    # "s":Ljava/lang/String;
    :cond_f
    return-object v0
.end method

.method public declared-synchronized getDataHandler()Lkorex/activation/DataHandler;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1423
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->dh:Lkorex/activation/DataHandler;

    if-nez v0, :cond_c

    .line 1424
    new-instance v0, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;

    invoke-direct {v0, p0}, Lkorex/mail/internet/MimeBodyPart$MimePartDataHandler;-><init>(Lkorex/mail/internet/MimePart;)V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->dh:Lkorex/activation/DataHandler;

    .line 1425
    :cond_c
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->dh:Lkorex/activation/DataHandler;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 1423
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1149
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getDescription(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisposition()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1036
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getDisposition(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1067
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getEncoding(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1283
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->getFileName(Lkorex/mail/internet/MimePart;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getFlags()Lkorex/mail/Flags;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2082
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0}, Lkorex/mail/Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/Flags;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getFrom()[Lkorex/mail/Address;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 375
    const-string v1, "From"

    invoke-direct {p0, v1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v0

    .line 376
    .local v0, "a":[Lkorex/mail/Address;
    if-nez v0, :cond_e

    .line 377
    const-string v1, "Sender"

    invoke-direct {p0, v1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v0

    .line 379
    :cond_e
    return-object v0
.end method

.method public getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1921
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1904
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1345
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v0

    invoke-virtual {v0}, Lkorex/activation/DataHandler;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getLineCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 975
    const/4 v0, -0x1

    return v0
.end method

.method public getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2054
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2006
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMessageID()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1259
    const-string v0, "Message-ID"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2066
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2018
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getRawInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1390
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getContentStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getReceivedDate()Ljava/util/Date;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 924
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 564
    sget-object v1, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v1, :cond_15

    .line 565
    const-string v1, "Newsgroups"

    const-string v2, ","

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 566
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_10

    const/4 v1, 0x0

    .line 568
    .end local v0    # "s":Ljava/lang/String;
    :goto_f
    return-object v1

    .line 566
    .restart local v0    # "s":Ljava/lang/String;
    :cond_10
    invoke-static {v0}, Lkorex/mail/internet/NewsAddress;->parse(Ljava/lang/String;)[Lkorex/mail/internet/NewsAddress;

    move-result-object v1

    goto :goto_f

    .line 568
    .end local v0    # "s":Ljava/lang/String;
    :cond_15
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v1

    goto :goto_f
.end method

.method public getReplyTo()[Lkorex/mail/Address;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 711
    const-string v1, "Reply-To"

    invoke-direct {p0, v1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v0

    .line 712
    .local v0, "a":[Lkorex/mail/Address;
    if-eqz v0, :cond_b

    array-length v1, v0

    if-nez v1, :cond_f

    .line 713
    :cond_b
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v0

    .line 714
    :cond_f
    return-object v0
.end method

.method public getSender()Lkorex/mail/Address;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 479
    const-string v1, "Sender"

    invoke-direct {p0, v1}, Lkorex/mail/internet/MimeMessage;->getAddressHeader(Ljava/lang/String;)[Lkorex/mail/Address;

    move-result-object v0

    .line 480
    .local v0, "a":[Lkorex/mail/Address;
    if-eqz v0, :cond_b

    array-length v1, v0

    if-nez v1, :cond_d

    .line 481
    :cond_b
    const/4 v1, 0x0

    .line 482
    :goto_c
    return-object v1

    :cond_d
    const/4 v1, 0x0

    aget-object v1, v0, v1

    goto :goto_c
.end method

.method public getSentDate()Ljava/util/Date;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 874
    const-string v2, "Date"

    invoke-virtual {p0, v2, v3}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 875
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_1a

    .line 877
    :try_start_9
    sget-object v4, Lkorex/mail/internet/MimeMessage;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    monitor-enter v4
    :try_end_c
    .catch Ljava/text/ParseException; {:try_start_9 .. :try_end_c} :catch_17

    .line 878
    :try_start_c
    sget-object v2, Lkorex/mail/internet/MimeMessage;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    invoke-virtual {v2, v1}, Lkorex/mail/internet/MailDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    monitor-exit v4

    .line 885
    :goto_13
    return-object v2

    .line 879
    :catchall_14
    move-exception v2

    monitor-exit v4
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_14

    :try_start_16
    throw v2
    :try_end_17
    .catch Ljava/text/ParseException; {:try_start_16 .. :try_end_17} :catch_17

    .line 880
    :catch_17
    move-exception v0

    .local v0, "pex":Ljava/text/ParseException;
    move-object v2, v3

    .line 881
    goto :goto_13

    .end local v0    # "pex":Ljava/text/ParseException;
    :cond_1a
    move-object v2, v3

    .line 885
    goto :goto_13
.end method

.method public getSize()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 945
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    if-eqz v1, :cond_8

    .line 946
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    array-length v0, v1

    .line 958
    :cond_7
    :goto_7
    return v0

    .line 947
    :cond_8
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    if-eqz v1, :cond_14

    .line 949
    :try_start_c
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_11} :catch_16

    move-result v0

    .line 952
    .local v0, "size":I
    if-gtz v0, :cond_7

    .line 958
    .end local v0    # "size":I
    :cond_14
    :goto_14
    const/4 v0, -0x1

    goto :goto_7

    .line 954
    :catch_16
    move-exception v1

    goto :goto_14
.end method

.method public getSubject()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 784
    const-string v3, "Subject"

    invoke-virtual {p0, v3, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 786
    .local v1, "rawvalue":Ljava/lang/String;
    if-nez v1, :cond_b

    move-object v1, v2

    .line 792
    .end local v1    # "rawvalue":Ljava/lang/String;
    :goto_a
    return-object v1

    .line 790
    .restart local v1    # "rawvalue":Ljava/lang/String;
    :cond_b
    :try_start_b
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->unfold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lkorex/mail/internet/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b .. :try_end_12} :catch_14

    move-result-object v1

    goto :goto_a

    .line 791
    :catch_14
    move-exception v0

    .line 792
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    goto :goto_a
.end method

.method public isMimeType(Ljava/lang/String;)Z
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1018
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->isMimeType(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isSet(Lkorex/mail/Flags$Flag;)Z
    .registers 3
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2105
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0, p1}, Lkorex/mail/Flags;->contains(Lkorex/mail/Flags$Flag;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected parse(Ljava/io/InputStream;)V
    .registers 9
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 340
    instance-of v3, p1, Ljava/io/ByteArrayInputStream;

    if-nez v3, :cond_12

    instance-of v3, p1, Ljava/io/BufferedInputStream;

    if-nez v3, :cond_12

    instance-of v3, p1, Lkorex/mail/internet/SharedInputStream;

    if-nez v3, :cond_12

    .line 343
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .end local p1    # "is":Ljava/io/InputStream;
    .local v1, "is":Ljava/io/InputStream;
    move-object p1, v1

    .line 345
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local p1    # "is":Ljava/io/InputStream;
    :cond_12
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeMessage;->createInternetHeaders(Ljava/io/InputStream;)Lkorex/mail/internet/InternetHeaders;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 347
    instance-of v3, p1, Lkorex/mail/internet/SharedInputStream;

    if-eqz v3, :cond_2f

    move-object v2, p1

    .line 348
    check-cast v2, Lkorex/mail/internet/SharedInputStream;

    .line 349
    .local v2, "sis":Lkorex/mail/internet/SharedInputStream;
    invoke-interface {v2}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v3

    const-wide/16 v5, -0x1

    invoke-interface {v2, v3, v4, v5, v6}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    .line 358
    .end local v2    # "sis":Lkorex/mail/internet/SharedInputStream;
    :goto_2b
    const/4 v3, 0x0

    iput-boolean v3, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 359
    return-void

    .line 352
    :cond_2f
    :try_start_2f
    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/io/InputStream;)[B

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/MimeMessage;->content:[B
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_35} :catch_36

    goto :goto_2b

    .line 353
    :catch_36
    move-exception v0

    .line 354
    .local v0, "ioex":Ljava/io/IOException;
    new-instance v3, Lkorex/mail/MessagingException;

    const-string v4, "IOException"

    invoke-direct {v3, v4, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method public removeHeader(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1975
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->removeHeader(Ljava/lang/String;)V

    .line 1976
    return-void
.end method

.method public reply(Z)Lkorex/mail/Message;
    .registers 3
    .param p1, "replyToAll"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1624
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->reply(ZZ)Lkorex/mail/Message;

    move-result-object v0

    return-object v0
.end method

.method public reply(ZZ)Lkorex/mail/Message;
    .registers 18
    .param p1, "replyToAll"    # Z
    .param p2, "setAnswered"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1663
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->createMimeMessage(Lkorex/mail/Session;)Lkorex/mail/internet/MimeMessage;

    move-result-object v11

    .line 1671
    .local v11, "reply":Lkorex/mail/internet/MimeMessage;
    const-string v1, "Subject"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1672
    .local v0, "subject":Ljava/lang/String;
    if-eqz v0, :cond_33

    .line 1673
    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "Re: "

    const/4 v4, 0x0

    const/4 v5, 0x4

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-nez v1, :cond_2e

    .line 1674
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Re: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1675
    :cond_2e
    const-string v1, "Subject"

    invoke-virtual {v11, v1, v0}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1677
    :cond_33
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getReplyTo()[Lkorex/mail/Address;

    move-result-object v6

    .line 1678
    .local v6, "a":[Lkorex/mail/Address;
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v11, v1, v6}, Lkorex/mail/internet/MimeMessage;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 1679
    if-eqz p1, :cond_b1

    .line 1680
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 1682
    .local v14, "v":Ljava/util/Vector;
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    invoke-static {v1}, Lkorex/mail/internet/InternetAddress;->getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;

    move-result-object v8

    .line 1683
    .local v8, "me":Lkorex/mail/internet/InternetAddress;
    if-eqz v8, :cond_4e

    .line 1684
    invoke-virtual {v14, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1686
    :cond_4e
    const/4 v7, 0x0

    .line 1687
    .local v7, "alternates":Ljava/lang/String;
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    if-eqz v1, :cond_5b

    .line 1688
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    const-string v2, "mail.alternates"

    invoke-virtual {v1, v2}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1689
    :cond_5b
    if-eqz v7, :cond_65

    .line 1690
    const/4 v1, 0x0

    .line 1691
    invoke-static {v7, v1}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    .line 1690
    invoke-direct {p0, v14, v1}, Lkorex/mail/internet/MimeMessage;->eliminateDuplicates(Ljava/util/Vector;[Lkorex/mail/Address;)[Lkorex/mail/Address;

    .line 1693
    :cond_65
    const/4 v13, 0x0

    .line 1694
    .local v13, "replyallccStr":Ljava/lang/String;
    const/4 v12, 0x0

    .line 1695
    .local v12, "replyallcc":Z
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    if-eqz v1, :cond_74

    .line 1696
    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    const-string v2, "mail.replyallcc"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/sun/mail/util/PropUtil;->getBooleanSessionProperty(Lkorex/mail/Session;Ljava/lang/String;Z)Z

    move-result v12

    .line 1699
    :cond_74
    invoke-direct {p0, v14, v6}, Lkorex/mail/internet/MimeMessage;->eliminateDuplicates(Ljava/util/Vector;[Lkorex/mail/Address;)[Lkorex/mail/Address;

    .line 1700
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v6

    .line 1701
    invoke-direct {p0, v14, v6}, Lkorex/mail/internet/MimeMessage;->eliminateDuplicates(Ljava/util/Vector;[Lkorex/mail/Address;)[Lkorex/mail/Address;

    move-result-object v6

    .line 1702
    if-eqz v6, :cond_8d

    array-length v1, v6

    if-lez v1, :cond_8d

    .line 1703
    if-eqz v12, :cond_106

    .line 1704
    sget-object v1, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v11, v1, v6}, Lkorex/mail/internet/MimeMessage;->addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 1708
    :cond_8d
    :goto_8d
    sget-object v1, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v6

    .line 1709
    invoke-direct {p0, v14, v6}, Lkorex/mail/internet/MimeMessage;->eliminateDuplicates(Ljava/util/Vector;[Lkorex/mail/Address;)[Lkorex/mail/Address;

    move-result-object v6

    .line 1710
    if-eqz v6, :cond_a1

    array-length v1, v6

    if-lez v1, :cond_a1

    .line 1711
    sget-object v1, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v11, v1, v6}, Lkorex/mail/internet/MimeMessage;->addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 1713
    :cond_a1
    sget-object v1, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;

    move-result-object v6

    .line 1714
    if-eqz v6, :cond_b1

    array-length v1, v6

    if-lez v1, :cond_b1

    .line 1715
    sget-object v1, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    invoke-virtual {v11, v1, v6}, Lkorex/mail/internet/MimeMessage;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 1718
    .end local v7    # "alternates":Ljava/lang/String;
    .end local v8    # "me":Lkorex/mail/internet/InternetAddress;
    .end local v12    # "replyallcc":Z
    .end local v13    # "replyallccStr":Ljava/lang/String;
    .end local v14    # "v":Ljava/util/Vector;
    :cond_b1
    const-string v1, "Message-Id"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1719
    .local v9, "msgId":Ljava/lang/String;
    if-eqz v9, :cond_bf

    .line 1720
    const-string v1, "In-Reply-To"

    invoke-virtual {v11, v1, v9}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1736
    :cond_bf
    const-string v1, "References"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1737
    .local v10, "refs":Ljava/lang/String;
    if-nez v10, :cond_d1

    .line 1739
    const-string v1, "In-Reply-To"

    const-string v2, " "

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1741
    :cond_d1
    if-eqz v9, :cond_f0

    .line 1742
    if-eqz v10, :cond_10c

    .line 1743
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v10}, Lkorex/mail/internet/MimeUtility;->unfold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1747
    :cond_f0
    :goto_f0
    if-eqz v10, :cond_fd

    .line 1748
    const-string v1, "References"

    const/16 v2, 0xc

    invoke-static {v2, v10}, Lkorex/mail/internet/MimeUtility;->fold(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v1, v2}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1750
    :cond_fd
    if-eqz p2, :cond_105

    .line 1752
    :try_start_ff
    sget-object v1, Lkorex/mail/internet/MimeMessage;->answeredFlag:Lkorex/mail/Flags;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->setFlags(Lkorex/mail/Flags;Z)V
    :try_end_105
    .catch Lkorex/mail/MessagingException; {:try_start_ff .. :try_end_105} :catch_10e

    .line 1757
    :cond_105
    :goto_105
    return-object v11

    .line 1706
    .end local v9    # "msgId":Ljava/lang/String;
    .end local v10    # "refs":Ljava/lang/String;
    .restart local v7    # "alternates":Ljava/lang/String;
    .restart local v8    # "me":Lkorex/mail/internet/InternetAddress;
    .restart local v12    # "replyallcc":Z
    .restart local v13    # "replyallccStr":Ljava/lang/String;
    .restart local v14    # "v":Ljava/util/Vector;
    :cond_106
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v11, v1, v6}, Lkorex/mail/internet/MimeMessage;->addRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    goto :goto_8d

    .line 1745
    .end local v7    # "alternates":Ljava/lang/String;
    .end local v8    # "me":Lkorex/mail/internet/InternetAddress;
    .end local v12    # "replyallcc":Z
    .end local v13    # "replyallccStr":Ljava/lang/String;
    .end local v14    # "v":Ljava/util/Vector;
    .restart local v9    # "msgId":Ljava/lang/String;
    .restart local v10    # "refs":Ljava/lang/String;
    :cond_10c
    move-object v10, v9

    goto :goto_f0

    .line 1753
    :catch_10e
    move-exception v1

    goto :goto_105
.end method

.method public saveChanges()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 2152
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    .line 2153
    iput-boolean v0, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    .line 2154
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->updateHeaders()V

    .line 2155
    return-void
.end method

.method public setContent(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1515
    instance-of v0, p1, Lkorex/mail/Multipart;

    if-eqz v0, :cond_a

    .line 1516
    check-cast p1, Lkorex/mail/Multipart;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeMessage;->setContent(Lkorex/mail/Multipart;)V

    .line 1519
    :goto_9
    return-void

    .line 1518
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_a
    new-instance v0, Lkorex/activation/DataHandler;

    invoke-direct {v0, p1, p2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->setDataHandler(Lkorex/activation/DataHandler;)V

    goto :goto_9
.end method

.method public setContent(Lkorex/mail/Multipart;)V
    .registers 4
    .param p1, "mp"    # Lkorex/mail/Multipart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1590
    new-instance v0, Lkorex/activation/DataHandler;

    invoke-virtual {p1}, Lkorex/mail/Multipart;->getContentType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 1591
    invoke-virtual {p1, p0}, Lkorex/mail/Multipart;->setParent(Lkorex/mail/Part;)V

    .line 1592
    return-void
.end method

.method public setContentID(Ljava/lang/String;)V
    .registers 3
    .param p1, "cid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1098
    if-nez p1, :cond_8

    .line 1099
    const-string v0, "Content-ID"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 1102
    :goto_7
    return-void

    .line 1101
    :cond_8
    const-string v0, "Content-ID"

    invoke-virtual {p0, v0, p1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method public setContentLanguage([Ljava/lang/String;)V
    .registers 2
    .param p1, "languages"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1241
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setContentLanguage(Lkorex/mail/internet/MimePart;[Ljava/lang/String;)V

    .line 1242
    return-void
.end method

.method public setContentMD5(Ljava/lang/String;)V
    .registers 3
    .param p1, "md5"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1129
    const-string v0, "Content-MD5"

    invoke-virtual {p0, v0, p1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1130
    return-void
.end method

.method public declared-synchronized setDataHandler(Lkorex/activation/DataHandler;)V
    .registers 3
    .param p1, "dh"    # Lkorex/activation/DataHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1489
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lkorex/mail/internet/MimeMessage;->dh:Lkorex/activation/DataHandler;

    .line 1490
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    .line 1491
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->invalidateContentHeaders(Lkorex/mail/internet/MimePart;)V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 1492
    monitor-exit p0

    return-void

    .line 1489
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1178
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->setDescription(Ljava/lang/String;Ljava/lang/String;)V

    .line 1179
    return-void
.end method

.method public setDescription(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1209
    invoke-static {p0, p1, p2}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;)V

    .line 1210
    return-void
.end method

.method public setDisposition(Ljava/lang/String;)V
    .registers 2
    .param p1, "disposition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1051
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 1052
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .registers 2
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1307
    invoke-static {p0, p1}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 1308
    return-void
.end method

.method public declared-synchronized setFlags(Lkorex/mail/Flags;Z)V
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags;
    .param p2, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2121
    monitor-enter p0

    if-eqz p2, :cond_a

    .line 2122
    :try_start_3
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0, p1}, Lkorex/mail/Flags;->add(Lkorex/mail/Flags;)V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_10

    .line 2125
    :goto_8
    monitor-exit p0

    return-void

    .line 2124
    :cond_a
    :try_start_a
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0, p1}, Lkorex/mail/Flags;->remove(Lkorex/mail/Flags;)V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_10

    goto :goto_8

    .line 2121
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFrom()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 435
    const/4 v1, 0x0

    .line 437
    .local v1, "me":Lkorex/mail/internet/InternetAddress;
    :try_start_1
    iget-object v2, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    invoke-static {v2}, Lkorex/mail/internet/InternetAddress;->_getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_d

    move-result-object v1

    .line 443
    if-eqz v1, :cond_16

    .line 444
    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->setFrom(Lkorex/mail/Address;)V

    .line 447
    return-void

    .line 438
    :catch_d
    move-exception v0

    .line 441
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Lkorex/mail/MessagingException;

    const-string v3, "No From address"

    invoke-direct {v2, v3, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2

    .line 446
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_16
    new-instance v2, Lkorex/mail/MessagingException;

    const-string v3, "No From address"

    invoke-direct {v2, v3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setFrom(Ljava/lang/String;)V
    .registers 4
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 417
    if-nez p1, :cond_8

    .line 418
    const-string v0, "From"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 421
    :goto_7
    return-void

    .line 420
    :cond_8
    const-string v0, "From"

    invoke-static {p1}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    goto :goto_7
.end method

.method public setFrom(Lkorex/mail/Address;)V
    .registers 4
    .param p1, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 396
    if-nez p1, :cond_8

    .line 397
    const-string v0, "From"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 400
    :goto_7
    return-void

    .line 399
    :cond_8
    const-string v0, "From"

    invoke-virtual {p1}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1942
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 1943
    return-void
.end method

.method public setRecipients(Lkorex/mail/Message$RecipientType;Ljava/lang/String;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 643
    sget-object v0, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v0, :cond_18

    .line 644
    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_12

    .line 645
    :cond_c
    const-string v0, "Newsgroups"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 651
    :goto_11
    return-void

    .line 647
    :cond_12
    const-string v0, "Newsgroups"

    invoke-virtual {p0, v0, p2}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_11

    .line 649
    :cond_18
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;

    move-result-object v1

    if-nez p2, :cond_23

    const/4 v0, 0x0

    :goto_1f
    invoke-direct {p0, v1, v0}, Lkorex/mail/internet/MimeMessage;->setAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    goto :goto_11

    .line 650
    :cond_23
    invoke-static {p2}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v0

    goto :goto_1f
.end method

.method public setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    .registers 5
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 614
    sget-object v0, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    if-ne p1, v0, :cond_19

    .line 615
    if-eqz p2, :cond_9

    array-length v0, p2

    if-nez v0, :cond_f

    .line 616
    :cond_9
    const-string v0, "Newsgroups"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 621
    :goto_e
    return-void

    .line 618
    :cond_f
    const-string v0, "Newsgroups"

    invoke-static {p2}, Lkorex/mail/internet/NewsAddress;->toString([Lkorex/mail/Address;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .line 620
    :cond_19
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMessage;->getHeaderName(Lkorex/mail/Message$RecipientType;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lkorex/mail/internet/MimeMessage;->setAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    goto :goto_e
.end method

.method public setReplyTo([Lkorex/mail/Address;)V
    .registers 3
    .param p1, "addresses"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 729
    const-string v0, "Reply-To"

    invoke-direct {p0, v0, p1}, Lkorex/mail/internet/MimeMessage;->setAddressHeader(Ljava/lang/String;[Lkorex/mail/Address;)V

    .line 730
    return-void
.end method

.method public setSender(Lkorex/mail/Address;)V
    .registers 4
    .param p1, "address"    # Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 500
    if-nez p1, :cond_8

    .line 501
    const-string v0, "Sender"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 504
    :goto_7
    return-void

    .line 503
    :cond_8
    const-string v0, "Sender"

    invoke-virtual {p1}, Lkorex/mail/Address;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method public setSentDate(Ljava/util/Date;)V
    .registers 5
    .param p1, "d"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 901
    if-nez p1, :cond_8

    .line 902
    const-string v0, "Date"

    invoke-virtual {p0, v0}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 908
    :goto_7
    return-void

    .line 904
    :cond_8
    sget-object v1, Lkorex/mail/internet/MimeMessage;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    monitor-enter v1

    .line 905
    :try_start_b
    const-string v0, "Date"

    sget-object v2, Lkorex/mail/internet/MimeMessage;->mailDateFormat:Lkorex/mail/internet/MailDateFormat;

    invoke-virtual {v2, p1}, Lkorex/mail/internet/MailDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 906
    monitor-exit v1

    goto :goto_7

    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_b .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public setSubject(Ljava/lang/String;)V
    .registers 3
    .param p1, "subject"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 821
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->setSubject(Ljava/lang/String;Ljava/lang/String;)V

    .line 822
    return-void
.end method

.method public setSubject(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "subject"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 850
    if-nez p1, :cond_8

    .line 851
    const-string v1, "Subject"

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMessage;->removeHeader(Ljava/lang/String;)V

    .line 860
    :goto_7
    return-void

    .line 854
    :cond_8
    :try_start_8
    const-string v1, "Subject"

    const/16 v2, 0x9

    const/4 v3, 0x0

    .line 855
    invoke-static {p1, p2, v3}, Lkorex/mail/internet/MimeUtility;->encodeText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 854
    invoke-static {v2, v3}, Lkorex/mail/internet/MimeUtility;->fold(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_18} :catch_19

    goto :goto_7

    .line 856
    :catch_19
    move-exception v0

    .line 857
    .local v0, "uex":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "Encoding error"

    invoke-direct {v1, v2, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1541
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->setText(Ljava/lang/String;Ljava/lang/String;)V

    .line 1542
    return-void
.end method

.method public setText(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1557
    const-string v0, "plain"

    invoke-static {p0, p1, p2, v0}, Lkorex/mail/internet/MimeBodyPart;->setText(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1558
    return-void
.end method

.method public setText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .param p3, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1575
    invoke-static {p0, p1, p2, p3}, Lkorex/mail/internet/MimeBodyPart;->setText(Lkorex/mail/internet/MimePart;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1576
    return-void
.end method

.method protected declared-synchronized updateHeaders()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2193
    monitor-enter p0

    :try_start_1
    invoke-static {p0}, Lkorex/mail/internet/MimeBodyPart;->updateHeaders(Lkorex/mail/internet/MimePart;)V

    .line 2194
    const-string v0, "MIME-Version"

    const-string v1, "1.0"

    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2195
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->updateMessageID()V

    .line 2197
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    if-eqz v0, :cond_31

    .line 2198
    new-instance v0, Lkorex/activation/DataHandler;

    iget-object v1, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getContentType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lkorex/activation/DataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->dh:Lkorex/activation/DataHandler;

    .line 2199
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->cachedContent:Ljava/lang/Object;

    .line 2200
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    .line 2201
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;
    :try_end_27
    .catchall {:try_start_1 .. :try_end_27} :catchall_33

    if-eqz v0, :cond_2e

    .line 2203
    :try_start_29
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2e} :catch_36
    .catchall {:try_start_29 .. :try_end_2e} :catchall_33

    .line 2206
    :cond_2e
    :goto_2e
    const/4 v0, 0x0

    :try_start_2f
    iput-object v0, p0, Lkorex/mail/internet/MimeMessage;->contentStream:Ljava/io/InputStream;
    :try_end_31
    .catchall {:try_start_2f .. :try_end_31} :catchall_33

    .line 2208
    :cond_31
    monitor-exit p0

    return-void

    .line 2193
    :catchall_33
    move-exception v0

    monitor-exit p0

    throw v0

    .line 2204
    :catch_36
    move-exception v0

    goto :goto_2e
.end method

.method protected updateMessageID()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2166
    const-string v0, "Message-ID"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/internet/MimeMessage;->session:Lkorex/mail/Session;

    .line 2167
    invoke-static {v2}, Lkorex/mail/internet/UniqueValue;->getUniqueMessageIDValue(Lkorex/mail/Session;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2166
    invoke-virtual {p0, v0, v1}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 2169
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1826
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 1827
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;[Ljava/lang/String;)V
    .registers 9
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "ignoreList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1848
    iget-boolean v5, p0, Lkorex/mail/internet/MimeMessage;->saved:Z

    if-nez v5, :cond_7

    .line 1849
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->saveChanges()V

    .line 1851
    :cond_7
    iget-boolean v5, p0, Lkorex/mail/internet/MimeMessage;->modified:Z

    if-eqz v5, :cond_f

    .line 1852
    invoke-static {p0, p1, p2}, Lkorex/mail/internet/MimeBodyPart;->writeTo(Lkorex/mail/internet/MimePart;Ljava/io/OutputStream;[Ljava/lang/String;)V

    .line 1887
    :goto_e
    return-void

    .line 1858
    :cond_f
    invoke-virtual {p0, p2}, Lkorex/mail/internet/MimeMessage;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v1

    .line 1859
    .local v1, "hdrLines":Ljava/util/Enumeration;
    new-instance v4, Lcom/sun/mail/util/LineOutputStream;

    invoke-direct {v4, p1}, Lcom/sun/mail/util/LineOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1860
    .local v4, "los":Lcom/sun/mail/util/LineOutputStream;
    :goto_18
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_28

    .line 1861
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V

    goto :goto_18

    .line 1864
    :cond_28
    invoke-virtual {v4}, Lcom/sun/mail/util/LineOutputStream;->writeln()V

    .line 1867
    iget-object v5, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    if-nez v5, :cond_55

    .line 1870
    const/4 v2, 0x0

    .line 1871
    .local v2, "is":Ljava/io/InputStream;
    const/16 v5, 0x2000

    new-array v0, v5, [B

    .line 1873
    .local v0, "buf":[B
    :try_start_34
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMessage;->getContentStream()Ljava/io/InputStream;

    move-result-object v2

    .line 1876
    :goto_38
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    if-lez v3, :cond_4b

    .line 1877
    const/4 v5, 0x0

    invoke-virtual {p1, v0, v5, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_42
    .catchall {:try_start_34 .. :try_end_42} :catchall_43

    goto :goto_38

    .line 1879
    .end local v3    # "len":I
    :catchall_43
    move-exception v5

    if-eqz v2, :cond_49

    .line 1880
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 1881
    :cond_49
    const/4 v0, 0x0

    throw v5

    .line 1879
    .restart local v3    # "len":I
    :cond_4b
    if-eqz v2, :cond_50

    .line 1880
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 1881
    :cond_50
    const/4 v0, 0x0

    .line 1886
    .end local v0    # "buf":[B
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "len":I
    :goto_51
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    goto :goto_e

    .line 1884
    :cond_55
    iget-object v5, p0, Lkorex/mail/internet/MimeMessage;->content:[B

    invoke-virtual {p1, v5}, Ljava/io/OutputStream;->write([B)V

    goto :goto_51
.end method
