.class public Lkorex/mail/internet/MimeMultipart;
.super Lkorex/mail/Multipart;
.source "MimeMultipart.java"


# instance fields
.field protected allowEmpty:Z

.field protected complete:Z

.field protected ds:Lkorex/activation/DataSource;

.field protected ignoreExistingBoundaryParameter:Z

.field protected ignoreMissingBoundaryParameter:Z

.field protected ignoreMissingEndBoundary:Z

.field protected parsed:Z

.field protected preamble:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 197
    const-string v0, "mixed"

    invoke-direct {p0, v0}, Lkorex/mail/internet/MimeMultipart;-><init>(Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 7
    .param p1, "subtype"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 212
    invoke-direct {p0}, Lkorex/mail/Multipart;-><init>()V

    .line 124
    iput-object v3, p0, Lkorex/mail/internet/MimeMultipart;->ds:Lkorex/activation/DataSource;

    .line 132
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->parsed:Z

    .line 139
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->complete:Z

    .line 147
    iput-object v3, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;

    .line 156
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingEndBoundary:Z

    .line 166
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingBoundaryParameter:Z

    .line 176
    iput-boolean v4, p0, Lkorex/mail/internet/MimeMultipart;->ignoreExistingBoundaryParameter:Z

    .line 185
    iput-boolean v4, p0, Lkorex/mail/internet/MimeMultipart;->allowEmpty:Z

    .line 216
    invoke-static {}, Lkorex/mail/internet/UniqueValue;->getUniqueBoundaryValue()Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, "boundary":Ljava/lang/String;
    new-instance v1, Lkorex/mail/internet/ContentType;

    const-string v2, "multipart"

    invoke-direct {v1, v2, p1, v3}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V

    .line 218
    .local v1, "cType":Lkorex/mail/internet/ContentType;
    const-string v2, "boundary"

    invoke-virtual {v1, v2, v0}, Lkorex/mail/internet/ContentType;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-virtual {v1}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    .line 220
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->initializeProperties()V

    .line 221
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Lkorex/mail/BodyPart;)V
    .registers 6
    .param p1, "subtype"    # Ljava/lang/String;
    .param p2, "parts"    # [Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 248
    invoke-direct {p0, p1}, Lkorex/mail/internet/MimeMultipart;-><init>(Ljava/lang/String;)V

    .line 249
    array-length v2, p2

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v2, :cond_f

    aget-object v0, p2, v1

    .line 250
    .local v0, "bp":Lkorex/mail/BodyPart;
    invoke-super {p0, v0}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 249
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 251
    .end local v0    # "bp":Lkorex/mail/BodyPart;
    :cond_f
    return-void
.end method

.method public constructor <init>(Lkorex/activation/DataSource;)V
    .registers 6
    .param p1, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 273
    invoke-direct {p0}, Lkorex/mail/Multipart;-><init>()V

    .line 124
    iput-object v3, p0, Lkorex/mail/internet/MimeMultipart;->ds:Lkorex/activation/DataSource;

    .line 132
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMultipart;->parsed:Z

    .line 139
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMultipart;->complete:Z

    .line 147
    iput-object v3, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;

    .line 156
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingEndBoundary:Z

    .line 166
    iput-boolean v1, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingBoundaryParameter:Z

    .line 176
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->ignoreExistingBoundaryParameter:Z

    .line 185
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->allowEmpty:Z

    .line 275
    instance-of v1, p1, Lkorex/mail/MessageAware;

    if-eqz v1, :cond_28

    move-object v1, p1

    .line 276
    check-cast v1, Lkorex/mail/MessageAware;

    invoke-interface {v1}, Lkorex/mail/MessageAware;->getMessageContext()Lkorex/mail/MessageContext;

    move-result-object v0

    .line 277
    .local v0, "mc":Lkorex/mail/MessageContext;
    invoke-virtual {v0}, Lkorex/mail/MessageContext;->getPart()Lkorex/mail/Part;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMultipart;->setParent(Lkorex/mail/Part;)V

    .line 280
    .end local v0    # "mc":Lkorex/mail/MessageContext;
    :cond_28
    instance-of v1, p1, Lkorex/mail/MultipartDataSource;

    if-eqz v1, :cond_32

    .line 282
    check-cast p1, Lkorex/mail/MultipartDataSource;

    .end local p1    # "ds":Lkorex/activation/DataSource;
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeMultipart;->setMultipartDataSource(Lkorex/mail/MultipartDataSource;)V

    .line 291
    :goto_31
    return-void

    .line 288
    .restart local p1    # "ds":Lkorex/activation/DataSource;
    :cond_32
    iput-boolean v2, p0, Lkorex/mail/internet/MimeMultipart;->parsed:Z

    .line 289
    iput-object p1, p0, Lkorex/mail/internet/MimeMultipart;->ds:Lkorex/activation/DataSource;

    .line 290
    invoke-interface {p1}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    goto :goto_31
.end method

.method public varargs constructor <init>([Lkorex/mail/BodyPart;)V
    .registers 5
    .param p1, "parts"    # [Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 232
    invoke-direct {p0}, Lkorex/mail/internet/MimeMultipart;-><init>()V

    .line 233
    array-length v2, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v2, :cond_f

    aget-object v0, p1, v1

    .line 234
    .local v0, "bp":Lkorex/mail/BodyPart;
    invoke-super {p0, v0}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 233
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 235
    .end local v0    # "bp":Lkorex/mail/BodyPart;
    :cond_f
    return-void
.end method

.method private static allDashes(Ljava/lang/String;)Z
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 925
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_14

    .line 926
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-eq v1, v2, :cond_11

    .line 927
    const/4 v1, 0x0

    .line 929
    :goto_10
    return v1

    .line 925
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 929
    :cond_14
    const/4 v1, 0x1

    goto :goto_10
.end method

.method private createMimeBodyPartIs(Ljava/io/InputStream;)Lkorex/mail/internet/MimeBodyPart;
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1030
    :try_start_0
    invoke-virtual {p0, p1}, Lkorex/mail/internet/MimeMultipart;->createMimeBodyPart(Ljava/io/InputStream;)Lkorex/mail/internet/MimeBodyPart;
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_8

    move-result-object v0

    .line 1033
    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_7} :catch_d

    .line 1036
    :goto_7
    return-object v0

    .line 1032
    :catchall_8
    move-exception v0

    .line 1033
    :try_start_9
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_c} :catch_f

    .line 1036
    :goto_c
    throw v0

    .line 1034
    :catch_d
    move-exception v1

    goto :goto_7

    :catch_f
    move-exception v1

    goto :goto_c
.end method

.method private static readFully(Ljava/io/InputStream;[BII)I
    .registers 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 948
    if-nez p3, :cond_4

    .line 949
    const/4 v1, 0x0

    .line 959
    :cond_3
    :goto_3
    return v1

    .line 950
    :cond_4
    const/4 v1, 0x0

    .line 951
    .local v1, "total":I
    :goto_5
    if-lez p3, :cond_d

    .line 952
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 953
    .local v0, "bsize":I
    if-gtz v0, :cond_11

    .line 959
    .end local v0    # "bsize":I
    :cond_d
    if-gtz v1, :cond_3

    const/4 v1, -0x1

    goto :goto_3

    .line 955
    .restart local v0    # "bsize":I
    :cond_11
    add-int/2addr p2, v0

    .line 956
    add-int/2addr v1, v0

    .line 957
    sub-int/2addr p3, v0

    .line 958
    goto :goto_5
.end method

.method private skipFully(Ljava/io/InputStream;J)V
    .registers 9
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x0

    .line 967
    :goto_2
    cmp-long v2, p2, v3

    if-lez v2, :cond_18

    .line 968
    invoke-virtual {p1, p2, p3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 969
    .local v0, "cur":J
    cmp-long v2, v0, v3

    if-gtz v2, :cond_16

    .line 970
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "can\'t skip"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 971
    :cond_16
    sub-long/2addr p2, v0

    .line 972
    goto :goto_2

    .line 973
    .end local v0    # "cur":J
    :cond_18
    return-void
.end method


# virtual methods
.method public declared-synchronized addBodyPart(Lkorex/mail/BodyPart;)V
    .registers 3
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 422
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 423
    invoke-super {p0, p1}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 424
    monitor-exit p0

    return-void

    .line 422
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addBodyPart(Lkorex/mail/BodyPart;I)V
    .registers 4
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 442
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 443
    invoke-super {p0, p1, p2}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 444
    monitor-exit p0

    return-void

    .line 442
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 989
    new-instance v0, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v0, p1}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method protected createMimeBodyPart(Ljava/io/InputStream;)Lkorex/mail/internet/MimeBodyPart;
    .registers 3
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1024
    new-instance v0, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v0, p1}, Lkorex/mail/internet/MimeBodyPart;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method protected createMimeBodyPart(Lkorex/mail/internet/InternetHeaders;[B)Lkorex/mail/internet/MimeBodyPart;
    .registers 4
    .param p1, "headers"    # Lkorex/mail/internet/InternetHeaders;
    .param p2, "content"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1007
    new-instance v0, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v0, p1, p2}, Lkorex/mail/internet/MimeBodyPart;-><init>(Lkorex/mail/internet/InternetHeaders;[B)V

    return-object v0
.end method

.method public declared-synchronized getBodyPart(I)Lkorex/mail/BodyPart;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 351
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 352
    invoke-super {p0, p1}, Lkorex/mail/Multipart;->getBodyPart(I)Lkorex/mail/BodyPart;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_a

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 351
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getBodyPart(Ljava/lang/String;)Lkorex/mail/BodyPart;
    .registers 7
    .param p1, "CID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 365
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 367
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->getCount()I

    move-result v0

    .line 368
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v0, :cond_22

    .line 369
    invoke-virtual {p0, v1}, Lkorex/mail/internet/MimeMultipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v2

    check-cast v2, Lkorex/mail/internet/MimeBodyPart;

    .line 370
    .local v2, "part":Lkorex/mail/internet/MimeBodyPart;
    invoke-virtual {v2}, Lkorex/mail/internet/MimeBodyPart;->getContentID()Ljava/lang/String;

    move-result-object v3

    .line 371
    .local v3, "s":Ljava/lang/String;
    if-eqz v3, :cond_1f

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_24

    move-result v4

    if-eqz v4, :cond_1f

    .line 374
    .end local v2    # "part":Lkorex/mail/internet/MimeBodyPart;
    .end local v3    # "s":Ljava/lang/String;
    :goto_1d
    monitor-exit p0

    return-object v2

    .line 368
    .restart local v2    # "part":Lkorex/mail/internet/MimeBodyPart;
    .restart local v3    # "s":Ljava/lang/String;
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 374
    .end local v2    # "part":Lkorex/mail/internet/MimeBodyPart;
    .end local v3    # "s":Ljava/lang/String;
    :cond_22
    const/4 v2, 0x0

    goto :goto_1d

    .line 365
    .end local v0    # "count":I
    .end local v1    # "i":I
    :catchall_24
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized getCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 338
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 339
    invoke-super {p0}, Lkorex/mail/Multipart;->getCount()I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_a

    move-result v0

    monitor-exit p0

    return v0

    .line 338
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPreamble()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 476
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 477
    iget-object v0, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object v0

    .line 476
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected initializeProperties()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 304
    const-string v0, "mail.mime.multipart.ignoremissingendboundary"

    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingEndBoundary:Z

    .line 307
    const-string v0, "mail.mime.multipart.ignoremissingboundaryparameter"

    invoke-static {v0, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingBoundaryParameter:Z

    .line 310
    const-string v0, "mail.mime.multipart.ignoreexistingboundaryparameter"

    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/internet/MimeMultipart;->ignoreExistingBoundaryParameter:Z

    .line 313
    const-string v0, "mail.mime.multipart.allowempty"

    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lkorex/mail/internet/MimeMultipart;->allowEmpty:Z

    .line 315
    return-void
.end method

.method public declared-synchronized isComplete()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 462
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 463
    iget-boolean v0, p0, Lkorex/mail/internet/MimeMultipart;->complete:Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return v0

    .line 462
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized parse()V
    .registers 47
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 579
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->parsed:Z

    move/from16 v42, v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_a0

    if-eqz v42, :cond_b

    .line 919
    :goto_9
    monitor-exit p0

    return-void

    .line 582
    :cond_b
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lkorex/mail/internet/MimeMultipart;->initializeProperties()V
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_a0

    .line 584
    const/16 v24, 0x0

    .line 585
    .local v24, "in":Ljava/io/InputStream;
    const/16 v37, 0x0

    .line 586
    .local v37, "sin":Lkorex/mail/internet/SharedInputStream;
    const-wide/16 v39, 0x0

    .local v39, "start":J
    const-wide/16 v16, 0x0

    .line 589
    .local v16, "end":J
    :try_start_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lkorex/mail/internet/MimeMultipart;->ds:Lkorex/activation/DataSource;

    move-object/from16 v42, v0

    invoke-interface/range {v42 .. v42}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v24

    .line 590
    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/io/ByteArrayInputStream;

    move/from16 v42, v0

    if-nez v42, :cond_43

    move-object/from16 v0, v24

    instance-of v0, v0, Ljava/io/BufferedInputStream;

    move/from16 v42, v0

    if-nez v42, :cond_43

    move-object/from16 v0, v24

    instance-of v0, v0, Lkorex/mail/internet/SharedInputStream;

    move/from16 v42, v0

    if-nez v42, :cond_43

    .line 593
    new-instance v25, Ljava/io/BufferedInputStream;

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_41} :catch_a3
    .catchall {:try_start_16 .. :try_end_41} :catchall_a0

    .end local v24    # "in":Ljava/io/InputStream;
    .local v25, "in":Ljava/io/InputStream;
    move-object/from16 v24, v25

    .line 597
    .end local v25    # "in":Ljava/io/InputStream;
    .restart local v24    # "in":Ljava/io/InputStream;
    :cond_43
    :try_start_43
    move-object/from16 v0, v24

    instance-of v0, v0, Lkorex/mail/internet/SharedInputStream;

    move/from16 v42, v0

    if-eqz v42, :cond_51

    .line 598
    move-object/from16 v0, v24

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    move-object/from16 v37, v0

    .line 600
    :cond_51
    new-instance v14, Lkorex/mail/internet/ContentType;

    move-object/from16 v0, p0

    iget-object v0, v0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    move-object/from16 v42, v0

    move-object/from16 v0, v42

    invoke-direct {v14, v0}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 601
    .local v14, "cType":Lkorex/mail/internet/ContentType;
    const/4 v10, 0x0

    .line 602
    .local v10, "boundary":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->ignoreExistingBoundaryParameter:Z

    move/from16 v42, v0

    if-nez v42, :cond_86

    .line 603
    const-string v42, "boundary"

    move-object/from16 v0, v42

    invoke-virtual {v14, v0}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 604
    .local v11, "bp":Ljava/lang/String;
    if-eqz v11, :cond_86

    .line 605
    new-instance v42, Ljava/lang/StringBuilder;

    invoke-direct/range {v42 .. v42}, Ljava/lang/StringBuilder;-><init>()V

    const-string v43, "--"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 607
    .end local v11    # "bp":Ljava/lang/String;
    :cond_86
    if-nez v10, :cond_b2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingBoundaryParameter:Z

    move/from16 v42, v0

    if-nez v42, :cond_b2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->ignoreExistingBoundaryParameter:Z

    move/from16 v42, v0

    if-nez v42, :cond_b2

    .line 609
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "Missing boundary parameter"

    invoke-direct/range {v42 .. v43}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v42
    :try_end_a0
    .catchall {:try_start_43 .. :try_end_a0} :catchall_a0

    .line 579
    .end local v10    # "boundary":Ljava/lang/String;
    .end local v14    # "cType":Lkorex/mail/internet/ContentType;
    .end local v16    # "end":J
    .end local v24    # "in":Ljava/io/InputStream;
    .end local v37    # "sin":Lkorex/mail/internet/SharedInputStream;
    .end local v39    # "start":J
    :catchall_a0
    move-exception v42

    monitor-exit p0

    throw v42

    .line 594
    .restart local v16    # "end":J
    .restart local v24    # "in":Ljava/io/InputStream;
    .restart local v37    # "sin":Lkorex/mail/internet/SharedInputStream;
    .restart local v39    # "start":J
    :catch_a3
    move-exception v19

    .line 595
    .local v19, "ex":Ljava/lang/Exception;
    :try_start_a4
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "No inputstream from datasource"

    move-object/from16 v0, v42

    move-object/from16 v1, v43

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v42
    :try_end_b2
    .catchall {:try_start_a4 .. :try_end_b2} :catchall_a0

    .line 613
    .end local v19    # "ex":Ljava/lang/Exception;
    .restart local v10    # "boundary":Ljava/lang/String;
    .restart local v14    # "cType":Lkorex/mail/internet/ContentType;
    :cond_b2
    :try_start_b2
    new-instance v30, Lcom/sun/mail/util/LineInputStream;

    move-object/from16 v0, v30

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V

    .line 614
    .local v30, "lin":Lcom/sun/mail/util/LineInputStream;
    const/16 v34, 0x0

    .line 616
    .local v34, "preamblesb":Ljava/lang/StringBuffer;
    const/16 v32, 0x0

    .line 617
    .local v32, "lineSeparator":Ljava/lang/String;
    :cond_bf
    :goto_bf
    invoke-virtual/range {v30 .. v30}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v31

    .local v31, "line":Ljava/lang/String;
    if-eqz v31, :cond_f9

    .line 625
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    add-int/lit8 v23, v42, -0x1

    .local v23, "i":I
    :goto_cb
    if-ltz v23, :cond_e1

    .line 626
    move-object/from16 v0, v31

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v13

    .line 627
    .local v13, "c":C
    const/16 v42, 0x20

    move/from16 v0, v42

    if-eq v13, v0, :cond_117

    const/16 v42, 0x9

    move/from16 v0, v42

    if-eq v13, v0, :cond_117

    .line 630
    .end local v13    # "c":C
    :cond_e1
    const/16 v42, 0x0

    add-int/lit8 v43, v23, 0x1

    move-object/from16 v0, v31

    move/from16 v1, v42

    move/from16 v2, v43

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    .line 631
    if-eqz v10, :cond_141

    .line 632
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v42

    if-eqz v42, :cond_11a

    .line 679
    .end local v23    # "i":I
    :cond_f9
    :goto_f9
    if-eqz v34, :cond_105

    .line 680
    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, p0

    iput-object v0, v1, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;

    .line 682
    :cond_105
    if-nez v31, :cond_1c1

    .line 683
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->allowEmpty:Z

    move/from16 v42, v0
    :try_end_10d
    .catch Ljava/io/IOException; {:try_start_b2 .. :try_end_10d} :catch_19d
    .catchall {:try_start_b2 .. :try_end_10d} :catchall_1ac

    if-eqz v42, :cond_1b9

    .line 912
    :try_start_10f
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_112
    .catch Ljava/io/IOException; {:try_start_10f .. :try_end_112} :catch_114
    .catchall {:try_start_10f .. :try_end_112} :catchall_a0

    goto/16 :goto_9

    .line 913
    :catch_114
    move-exception v42

    goto/16 :goto_9

    .line 625
    .restart local v13    # "c":C
    .restart local v23    # "i":I
    :cond_117
    add-int/lit8 v23, v23, -0x1

    goto :goto_cb

    .line 634
    .end local v13    # "c":C
    :cond_11a
    :try_start_11a
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v43

    add-int/lit8 v43, v43, 0x2

    move/from16 v0, v42

    move/from16 v1, v43

    if-ne v0, v1, :cond_16b

    .line 635
    move-object/from16 v0, v31

    invoke-virtual {v0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v42

    if-eqz v42, :cond_16b

    const-string v42, "--"

    move-object/from16 v0, v31

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v42

    if-eqz v42, :cond_16b

    .line 636
    const/16 v31, 0x0

    .line 637
    goto :goto_f9

    .line 645
    :cond_141
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    const/16 v43, 0x2

    move/from16 v0, v42

    move/from16 v1, v43

    if-le v0, v1, :cond_16b

    const-string v42, "--"

    move-object/from16 v0, v31

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v42

    if-eqz v42, :cond_16b

    .line 646
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    const/16 v43, 0x4

    move/from16 v0, v42

    move/from16 v1, v43

    if-le v0, v1, :cond_1b1

    invoke-static/range {v31 .. v31}, Lkorex/mail/internet/MimeMultipart;->allDashes(Ljava/lang/String;)Z

    move-result v42

    if-eqz v42, :cond_1b1

    .line 661
    :cond_16b
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I
    :try_end_16e
    .catch Ljava/io/IOException; {:try_start_11a .. :try_end_16e} :catch_19d
    .catchall {:try_start_11a .. :try_end_16e} :catchall_1ac

    move-result v42

    if-lez v42, :cond_bf

    .line 664
    if-nez v32, :cond_17b

    .line 666
    :try_start_173
    const-string v42, "line.separator"

    const-string v43, "\n"

    .line 667
    invoke-static/range {v42 .. v43}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_17a
    .catch Ljava/lang/SecurityException; {:try_start_173 .. :try_end_17a} :catch_1b5
    .catch Ljava/io/IOException; {:try_start_173 .. :try_end_17a} :catch_19d
    .catchall {:try_start_173 .. :try_end_17a} :catchall_1ac

    move-result-object v32

    .line 673
    :cond_17b
    :goto_17b
    if-nez v34, :cond_18c

    .line 674
    :try_start_17d
    new-instance v34, Ljava/lang/StringBuffer;

    .end local v34    # "preamblesb":Ljava/lang/StringBuffer;
    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    add-int/lit8 v42, v42, 0x2

    move-object/from16 v0, v34

    move/from16 v1, v42

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 675
    .restart local v34    # "preamblesb":Ljava/lang/StringBuffer;
    :cond_18c
    move-object/from16 v0, v34

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_19b
    .catch Ljava/io/IOException; {:try_start_17d .. :try_end_19b} :catch_19d
    .catchall {:try_start_17d .. :try_end_19b} :catchall_1ac

    goto/16 :goto_bf

    .line 908
    .end local v23    # "i":I
    .end local v30    # "lin":Lcom/sun/mail/util/LineInputStream;
    .end local v31    # "line":Ljava/lang/String;
    .end local v32    # "lineSeparator":Ljava/lang/String;
    .end local v34    # "preamblesb":Ljava/lang/StringBuffer;
    :catch_19d
    move-exception v28

    .line 909
    .local v28, "ioex":Ljava/io/IOException;
    :try_start_19e
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "IO Error"

    move-object/from16 v0, v42

    move-object/from16 v1, v43

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v42
    :try_end_1ac
    .catchall {:try_start_19e .. :try_end_1ac} :catchall_1ac

    .line 911
    .end local v28    # "ioex":Ljava/io/IOException;
    :catchall_1ac
    move-exception v42

    .line 912
    :try_start_1ad
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_1b0
    .catch Ljava/io/IOException; {:try_start_1ad .. :try_end_1b0} :catch_45b
    .catchall {:try_start_1ad .. :try_end_1b0} :catchall_a0

    .line 915
    :goto_1b0
    :try_start_1b0
    throw v42
    :try_end_1b1
    .catchall {:try_start_1b0 .. :try_end_1b1} :catchall_a0

    .line 654
    .restart local v23    # "i":I
    .restart local v30    # "lin":Lcom/sun/mail/util/LineInputStream;
    .restart local v31    # "line":Ljava/lang/String;
    .restart local v32    # "lineSeparator":Ljava/lang/String;
    .restart local v34    # "preamblesb":Ljava/lang/StringBuffer;
    :cond_1b1
    move-object/from16 v10, v31

    .line 655
    goto/16 :goto_f9

    .line 668
    :catch_1b5
    move-exception v19

    .line 669
    .local v19, "ex":Ljava/lang/SecurityException;
    :try_start_1b6
    const-string v32, "\n"

    goto :goto_17b

    .line 686
    .end local v19    # "ex":Ljava/lang/SecurityException;
    .end local v23    # "i":I
    :cond_1b9
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "Missing start boundary"

    invoke-direct/range {v42 .. v43}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v42

    .line 690
    :cond_1c1
    invoke-static {v10}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    .line 691
    .local v9, "bndbytes":[B
    array-length v8, v9

    .line 698
    .local v8, "bl":I
    const/16 v42, 0x100

    move/from16 v0, v42

    new-array v7, v0, [I

    .line 699
    .local v7, "bcs":[I
    const/16 v23, 0x0

    .restart local v23    # "i":I
    :goto_1ce
    move/from16 v0, v23

    if-ge v0, v8, :cond_1e1

    .line 700
    aget-byte v42, v9, v23

    move/from16 v0, v42

    and-int/lit16 v0, v0, 0xff

    move/from16 v42, v0

    add-int/lit8 v43, v23, 0x1

    aput v43, v7, v42

    .line 699
    add-int/lit8 v23, v23, 0x1

    goto :goto_1ce

    .line 703
    :cond_1e1
    new-array v0, v8, [I

    move-object/from16 v21, v0

    .line 705
    .local v21, "gss":[I
    move/from16 v23, v8

    :goto_1e7
    if-lez v23, :cond_20e

    .line 707
    add-int/lit8 v29, v8, -0x1

    .local v29, "j":I
    :goto_1eb
    move/from16 v0, v29

    move/from16 v1, v23

    if-lt v0, v1, :cond_204

    .line 709
    aget-byte v42, v9, v29

    sub-int v43, v29, v23

    aget-byte v43, v9, v43

    move/from16 v0, v42

    move/from16 v1, v43

    if-ne v0, v1, :cond_20b

    .line 711
    add-int/lit8 v42, v29, -0x1

    aput v23, v21, v42

    .line 707
    add-int/lit8 v29, v29, -0x1

    goto :goto_1eb

    .line 718
    :cond_204
    :goto_204
    if-lez v29, :cond_20b

    .line 719
    add-int/lit8 v29, v29, -0x1

    aput v23, v21, v29

    goto :goto_204

    .line 705
    :cond_20b
    add-int/lit8 v23, v23, -0x1

    goto :goto_1e7

    .line 721
    .end local v29    # "j":I
    :cond_20e
    add-int/lit8 v42, v8, -0x1

    const/16 v43, 0x1

    aput v43, v21, v42

    .line 727
    const/4 v15, 0x0

    .line 729
    .local v15, "done":Z
    :goto_215
    if-nez v15, :cond_245

    .line 730
    const/16 v22, 0x0

    .line 731
    .local v22, "headers":Lkorex/mail/internet/InternetHeaders;
    if-eqz v37, :cond_252

    .line 732
    invoke-interface/range {v37 .. v37}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v39

    .line 734
    :cond_21f
    invoke-virtual/range {v30 .. v30}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v31

    if-eqz v31, :cond_22b

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->length()I

    move-result v42

    if-gtz v42, :cond_21f

    .line 736
    :cond_22b
    if-nez v31, :cond_25a

    .line 737
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingEndBoundary:Z

    move/from16 v42, v0

    if-nez v42, :cond_23d

    .line 738
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "missing multipart end boundary"

    invoke-direct/range {v42 .. v43}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v42

    .line 741
    :cond_23d
    const/16 v42, 0x0

    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lkorex/mail/internet/MimeMultipart;->complete:Z
    :try_end_245
    .catch Ljava/io/IOException; {:try_start_1b6 .. :try_end_245} :catch_19d
    .catchall {:try_start_1b6 .. :try_end_245} :catchall_1ac

    .line 912
    .end local v22    # "headers":Lkorex/mail/internet/InternetHeaders;
    :cond_245
    :try_start_245
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->close()V
    :try_end_248
    .catch Ljava/io/IOException; {:try_start_245 .. :try_end_248} :catch_458
    .catchall {:try_start_245 .. :try_end_248} :catchall_a0

    .line 918
    :goto_248
    const/16 v42, 0x1

    :try_start_24a
    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lkorex/mail/internet/MimeMultipart;->parsed:Z
    :try_end_250
    .catchall {:try_start_24a .. :try_end_250} :catchall_a0

    goto/16 :goto_9

    .line 746
    .restart local v22    # "headers":Lkorex/mail/internet/InternetHeaders;
    :cond_252
    :try_start_252
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeMultipart;->createInternetHeaders(Ljava/io/InputStream;)Lkorex/mail/internet/InternetHeaders;

    move-result-object v22

    .line 749
    :cond_25a
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->markSupported()Z

    move-result v42

    if-nez v42, :cond_268

    .line 750
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "Stream doesn\'t support mark"

    invoke-direct/range {v42 .. v43}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v42

    .line 752
    :cond_268
    const/4 v12, 0x0

    .line 754
    .local v12, "buf":Ljava/io/ByteArrayOutputStream;
    if-nez v37, :cond_2af

    .line 755
    new-instance v12, Ljava/io/ByteArrayOutputStream;

    .end local v12    # "buf":Ljava/io/ByteArrayOutputStream;
    invoke-direct {v12}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 769
    .restart local v12    # "buf":Ljava/io/ByteArrayOutputStream;
    :goto_270
    new-array v0, v8, [B

    move-object/from16 v27, v0

    .line 770
    .local v27, "inbuf":[B
    new-array v0, v8, [B

    move-object/from16 v36, v0

    .line 771
    .local v36, "previnbuf":[B
    const/16 v26, 0x0

    .line 772
    .local v26, "inSize":I
    const/16 v35, 0x0

    .line 774
    .local v35, "prevSize":I
    const/16 v20, 0x1

    .line 780
    .local v20, "first":Z
    :goto_27e
    add-int/lit8 v42, v8, 0x4

    move/from16 v0, v42

    add-int/lit16 v0, v0, 0x3e8

    move/from16 v42, v0

    move-object/from16 v0, v24

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 781
    const/16 v18, 0x0

    .line 782
    .local v18, "eolLen":I
    const/16 v42, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    move/from16 v2, v42

    invoke-static {v0, v1, v2, v8}, Lkorex/mail/internet/MimeMultipart;->readFully(Ljava/io/InputStream;[BII)I

    move-result v26

    .line 783
    move/from16 v0, v26

    if-ge v0, v8, :cond_2e0

    .line 785
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->ignoreMissingEndBoundary:Z

    move/from16 v42, v0

    if-nez v42, :cond_2b4

    .line 786
    new-instance v42, Lkorex/mail/MessagingException;

    const-string v43, "missing multipart end boundary"

    invoke-direct/range {v42 .. v43}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v42

    .line 757
    .end local v18    # "eolLen":I
    .end local v20    # "first":Z
    .end local v26    # "inSize":I
    .end local v27    # "inbuf":[B
    .end local v35    # "prevSize":I
    .end local v36    # "previnbuf":[B
    :cond_2af
    invoke-interface/range {v37 .. v37}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v16

    goto :goto_270

    .line 788
    .restart local v18    # "eolLen":I
    .restart local v20    # "first":Z
    .restart local v26    # "inSize":I
    .restart local v27    # "inbuf":[B
    .restart local v35    # "prevSize":I
    .restart local v36    # "previnbuf":[B
    :cond_2b4
    if-eqz v37, :cond_2ba

    .line 789
    invoke-interface/range {v37 .. v37}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v16

    .line 790
    :cond_2ba
    const/16 v42, 0x0

    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lkorex/mail/internet/MimeMultipart;->complete:Z

    .line 791
    const/4 v15, 0x1

    .line 894
    :cond_2c3
    :goto_2c3
    if-eqz v37, :cond_422

    .line 895
    move-object/from16 v0, v37

    move-wide/from16 v1, v39

    move-wide/from16 v3, v16

    invoke-interface {v0, v1, v2, v3, v4}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v42

    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-direct {v0, v1}, Lkorex/mail/internet/MimeMultipart;->createMimeBodyPartIs(Ljava/io/InputStream;)Lkorex/mail/internet/MimeBodyPart;

    move-result-object v33

    .line 906
    .local v33, "part":Lkorex/mail/internet/MimeBodyPart;
    :goto_2d7
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-super {v0, v1}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    goto/16 :goto_215

    .line 796
    .end local v33    # "part":Lkorex/mail/internet/MimeBodyPart;
    :cond_2e0
    add-int/lit8 v23, v8, -0x1

    :goto_2e2
    if-ltz v23, :cond_2ee

    .line 797
    aget-byte v42, v27, v23

    aget-byte v43, v9, v23

    move/from16 v0, v42

    move/from16 v1, v43

    if-eq v0, v1, :cond_357

    .line 800
    :cond_2ee
    if-gez v23, :cond_393

    .line 801
    const/16 v18, 0x0

    .line 802
    if-nez v20, :cond_320

    .line 805
    add-int/lit8 v42, v35, -0x1

    aget-byte v5, v36, v42

    .line 806
    .local v5, "b":I
    const/16 v42, 0xd

    move/from16 v0, v42

    if-eq v5, v0, :cond_304

    const/16 v42, 0xa

    move/from16 v0, v42

    if-ne v5, v0, :cond_320

    .line 807
    :cond_304
    const/16 v18, 0x1

    .line 808
    const/16 v42, 0xa

    move/from16 v0, v42

    if-ne v5, v0, :cond_320

    const/16 v42, 0x2

    move/from16 v0, v35

    move/from16 v1, v42

    if-lt v0, v1, :cond_320

    .line 809
    add-int/lit8 v42, v35, -0x2

    aget-byte v5, v36, v42

    .line 810
    const/16 v42, 0xd

    move/from16 v0, v42

    if-ne v5, v0, :cond_320

    .line 811
    const/16 v18, 0x2

    .line 815
    .end local v5    # "b":I
    :cond_320
    if-nez v20, :cond_324

    if-lez v18, :cond_391

    .line 816
    :cond_324
    if-eqz v37, :cond_336

    .line 819
    invoke-interface/range {v37 .. v37}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v42

    int-to-long v0, v8

    move-wide/from16 v44, v0

    sub-long v42, v42, v44

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v44, v0

    sub-long v16, v42, v44

    .line 822
    :cond_336
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 823
    .local v6, "b2":I
    const/16 v42, 0x2d

    move/from16 v0, v42

    if-ne v6, v0, :cond_35a

    .line 824
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->read()I

    move-result v42

    const/16 v43, 0x2d

    move/from16 v0, v42

    move/from16 v1, v43

    if-ne v0, v1, :cond_35a

    .line 825
    const/16 v42, 0x1

    move/from16 v0, v42

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lkorex/mail/internet/MimeMultipart;->complete:Z

    .line 826
    const/4 v15, 0x1

    .line 827
    goto/16 :goto_2c3

    .line 796
    .end local v6    # "b2":I
    :cond_357
    add-int/lit8 v23, v23, -0x1

    goto :goto_2e2

    .line 831
    .restart local v6    # "b2":I
    :cond_35a
    :goto_35a
    const/16 v42, 0x20

    move/from16 v0, v42

    if-eq v6, v0, :cond_366

    const/16 v42, 0x9

    move/from16 v0, v42

    if-ne v6, v0, :cond_36b

    .line 832
    :cond_366
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->read()I

    move-result v6

    goto :goto_35a

    .line 834
    :cond_36b
    const/16 v42, 0xa

    move/from16 v0, v42

    if-eq v6, v0, :cond_2c3

    .line 836
    const/16 v42, 0xd

    move/from16 v0, v42

    if-ne v6, v0, :cond_391

    .line 837
    const/16 v42, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/io/InputStream;->mark(I)V

    .line 838
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->read()I

    move-result v42

    const/16 v43, 0xa

    move/from16 v0, v42

    move/from16 v1, v43

    if-eq v0, v1, :cond_2c3

    .line 839
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->reset()V

    goto/16 :goto_2c3

    .line 843
    .end local v6    # "b2":I
    :cond_391
    const/16 v23, 0x0

    .line 853
    :cond_393
    add-int/lit8 v42, v23, 0x1

    aget-byte v43, v27, v23

    and-int/lit8 v43, v43, 0x7f

    aget v43, v7, v43

    sub-int v42, v42, v43

    aget v43, v21, v23

    invoke-static/range {v42 .. v43}, Ljava/lang/Math;->max(II)I

    move-result v38

    .line 855
    .local v38, "skip":I
    const/16 v42, 0x2

    move/from16 v0, v38

    move/from16 v1, v42

    if-ge v0, v1, :cond_3f9

    .line 859
    if-nez v37, :cond_3c2

    const/16 v42, 0x1

    move/from16 v0, v35

    move/from16 v1, v42

    if-le v0, v1, :cond_3c2

    .line 860
    const/16 v42, 0x0

    add-int/lit8 v43, v35, -0x1

    move-object/from16 v0, v36

    move/from16 v1, v42

    move/from16 v2, v43

    invoke-virtual {v12, v0, v1, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 861
    :cond_3c2
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->reset()V

    .line 862
    const-wide/16 v42, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-wide/from16 v2, v42

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/internet/MimeMultipart;->skipFully(Ljava/io/InputStream;J)V

    .line 863
    const/16 v42, 0x1

    move/from16 v0, v35

    move/from16 v1, v42

    if-lt v0, v1, :cond_3ee

    .line 865
    const/16 v42, 0x0

    add-int/lit8 v43, v35, -0x1

    aget-byte v43, v36, v43

    aput-byte v43, v36, v42

    .line 866
    const/16 v42, 0x1

    const/16 v43, 0x0

    aget-byte v43, v27, v43

    aput-byte v43, v36, v42

    .line 867
    const/16 v35, 0x2

    .line 887
    :goto_3ea
    const/16 v20, 0x0

    .line 888
    goto/16 :goto_27e

    .line 870
    :cond_3ee
    const/16 v42, 0x0

    const/16 v43, 0x0

    aget-byte v43, v27, v43

    aput-byte v43, v36, v42

    .line 871
    const/16 v35, 0x1

    goto :goto_3ea

    .line 876
    :cond_3f9
    if-lez v35, :cond_408

    if-nez v37, :cond_408

    .line 877
    const/16 v42, 0x0

    move-object/from16 v0, v36

    move/from16 v1, v42

    move/from16 v2, v35

    invoke-virtual {v12, v0, v1, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 879
    :cond_408
    move/from16 v35, v38

    .line 880
    invoke-virtual/range {v24 .. v24}, Ljava/io/InputStream;->reset()V

    .line 881
    move/from16 v0, v35

    int-to-long v0, v0

    move-wide/from16 v42, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-wide/from16 v2, v42

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/internet/MimeMultipart;->skipFully(Ljava/io/InputStream;J)V

    .line 883
    move-object/from16 v41, v27

    .line 884
    .local v41, "tmp":[B
    move-object/from16 v27, v36

    .line 885
    move-object/from16 v36, v41

    goto :goto_3ea

    .line 898
    .end local v38    # "skip":I
    .end local v41    # "tmp":[B
    :cond_422
    sub-int v42, v35, v18

    if-lez v42, :cond_433

    .line 899
    const/16 v42, 0x0

    sub-int v43, v35, v18

    move-object/from16 v0, v36

    move/from16 v1, v42

    move/from16 v2, v43

    invoke-virtual {v12, v0, v1, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 902
    :cond_433
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lkorex/mail/internet/MimeMultipart;->complete:Z

    move/from16 v42, v0

    if-nez v42, :cond_448

    if-lez v26, :cond_448

    .line 903
    const/16 v42, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v42

    move/from16 v2, v26

    invoke-virtual {v12, v0, v1, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 904
    :cond_448
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v42

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lkorex/mail/internet/MimeMultipart;->createMimeBodyPart(Lkorex/mail/internet/InternetHeaders;[B)Lkorex/mail/internet/MimeBodyPart;
    :try_end_455
    .catch Ljava/io/IOException; {:try_start_252 .. :try_end_455} :catch_19d
    .catchall {:try_start_252 .. :try_end_455} :catchall_1ac

    move-result-object v33

    .restart local v33    # "part":Lkorex/mail/internet/MimeBodyPart;
    goto/16 :goto_2d7

    .line 913
    .end local v12    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "eolLen":I
    .end local v20    # "first":Z
    .end local v22    # "headers":Lkorex/mail/internet/InternetHeaders;
    .end local v26    # "inSize":I
    .end local v27    # "inbuf":[B
    .end local v33    # "part":Lkorex/mail/internet/MimeBodyPart;
    .end local v35    # "prevSize":I
    .end local v36    # "previnbuf":[B
    :catch_458
    move-exception v42

    goto/16 :goto_248

    .end local v7    # "bcs":[I
    .end local v8    # "bl":I
    .end local v9    # "bndbytes":[B
    .end local v15    # "done":Z
    .end local v21    # "gss":[I
    .end local v23    # "i":I
    .end local v30    # "lin":Lcom/sun/mail/util/LineInputStream;
    .end local v31    # "line":Ljava/lang/String;
    .end local v32    # "lineSeparator":Ljava/lang/String;
    .end local v34    # "preamblesb":Ljava/lang/StringBuffer;
    :catch_45b
    move-exception v43

    goto/16 :goto_1b0
.end method

.method public removeBodyPart(I)V
    .registers 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 406
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 407
    invoke-super {p0, p1}, Lkorex/mail/Multipart;->removeBodyPart(I)V

    .line 408
    return-void
.end method

.method public removeBodyPart(Lkorex/mail/BodyPart;)Z
    .registers 3
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 389
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 390
    invoke-super {p0, p1}, Lkorex/mail/Multipart;->removeBodyPart(Lkorex/mail/BodyPart;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized setPreamble(Ljava/lang/String;)V
    .registers 3
    .param p1, "preamble"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 494
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 495
    monitor-exit p0

    return-void

    .line 494
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSubType(Ljava/lang/String;)V
    .registers 4
    .param p1, "subtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 327
    monitor-enter p0

    :try_start_1
    new-instance v0, Lkorex/mail/internet/ContentType;

    iget-object v1, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    invoke-direct {v0, v1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 328
    .local v0, "cType":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0, p1}, Lkorex/mail/internet/ContentType;->setSubType(Ljava/lang/String;)V

    .line 329
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 330
    monitor-exit p0

    return-void

    .line 327
    .end local v0    # "cType":Lkorex/mail/internet/ContentType;
    :catchall_13
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized updateHeaders()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 517
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 518
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Lkorex/mail/internet/MimeMultipart;->parts:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 519
    iget-object v1, p0, Lkorex/mail/internet/MimeMultipart;->parts:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/internet/MimeBodyPart;

    invoke-virtual {v1}, Lkorex/mail/internet/MimeBodyPart;->updateHeaders()V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1d

    .line 518
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 520
    :cond_1b
    monitor-exit p0

    return-void

    .line 517
    .end local v0    # "i":I
    :catchall_1d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized writeTo(Ljava/io/OutputStream;)V
    .registers 9
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 528
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lkorex/mail/internet/MimeMultipart;->parse()V

    .line 530
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Lkorex/mail/internet/ContentType;

    iget-object v6, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    invoke-direct {v5, v6}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    const-string v6, "boundary"

    .line 531
    invoke-virtual {v5, v6}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 532
    .local v0, "boundary":Ljava/lang/String;
    new-instance v2, Lcom/sun/mail/util/LineOutputStream;

    invoke-direct {v2, p1}, Lcom/sun/mail/util/LineOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 535
    .local v2, "los":Lcom/sun/mail/util/LineOutputStream;
    iget-object v4, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;

    if-eqz v4, :cond_4e

    .line 536
    iget-object v4, p0, Lkorex/mail/internet/MimeMultipart;->preamble:Ljava/lang/String;

    invoke-static {v4}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 537
    .local v3, "pb":[B
    invoke-virtual {v2, v3}, Lcom/sun/mail/util/LineOutputStream;->write([B)V

    .line 539
    array-length v4, v3

    if-lez v4, :cond_4e

    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    aget-byte v4, v3, v4

    const/16 v5, 0xd

    if-eq v4, v5, :cond_4e

    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    aget-byte v4, v3, v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_4e

    .line 541
    invoke-virtual {v2}, Lcom/sun/mail/util/LineOutputStream;->writeln()V

    .line 546
    .end local v3    # "pb":[B
    :cond_4e
    iget-object v4, p0, Lkorex/mail/internet/MimeMultipart;->parts:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-nez v4, :cond_96

    .line 547
    iget-boolean v4, p0, Lkorex/mail/internet/MimeMultipart;->allowEmpty:Z

    if-eqz v4, :cond_78

    .line 549
    invoke-virtual {v2, v0}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V

    .line 550
    invoke-virtual {v2}, Lcom/sun/mail/util/LineOutputStream;->writeln()V

    .line 563
    :cond_60
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V
    :try_end_76
    .catchall {:try_start_1 .. :try_end_76} :catchall_93

    .line 564
    monitor-exit p0

    return-void

    .line 552
    :cond_78
    :try_start_78
    new-instance v4, Lkorex/mail/MessagingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Empty multipart: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lkorex/mail/internet/MimeMultipart;->contentType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_93
    .catchall {:try_start_78 .. :try_end_93} :catchall_93

    .line 528
    .end local v0    # "boundary":Ljava/lang/String;
    .end local v2    # "los":Lcom/sun/mail/util/LineOutputStream;
    :catchall_93
    move-exception v4

    monitor-exit p0

    throw v4

    .line 555
    .restart local v0    # "boundary":Ljava/lang/String;
    .restart local v2    # "los":Lcom/sun/mail/util/LineOutputStream;
    :cond_96
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_97
    :try_start_97
    iget-object v4, p0, Lkorex/mail/internet/MimeMultipart;->parts:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-ge v1, v4, :cond_60

    .line 556
    invoke-virtual {v2, v0}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V

    .line 557
    iget-object v4, p0, Lkorex/mail/internet/MimeMultipart;->parts:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkorex/mail/internet/MimeBodyPart;

    invoke-virtual {v4, p1}, Lkorex/mail/internet/MimeBodyPart;->writeTo(Ljava/io/OutputStream;)V

    .line 558
    invoke-virtual {v2}, Lcom/sun/mail/util/LineOutputStream;->writeln()V
    :try_end_b0
    .catchall {:try_start_97 .. :try_end_b0} :catchall_93

    .line 555
    add-int/lit8 v1, v1, 0x1

    goto :goto_97
.end method
