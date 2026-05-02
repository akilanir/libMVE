.class public Lorg/kore/kolab/notes/imap/ImapNotesRepository;
.super Lorg/kore/kolab/notes/local/LocalNotesRepository;
.source "ImapNotesRepository.java"

# interfaces
.implements Lorg/kore/kolab/notes/RemoteNotesRepository;


# static fields
.field static final KOLAB_TEXT:Ljava/lang/String; = "This is a Kolab Groupware object.\nTo view this object you will need a Kolab Groupware Client.\nFor a list of Kolab Groupware Clients please visit:\nhttp://www.kolab.org"

.field static final NOT_LOADED:Ljava/lang/String; = "NOT_LOADED"


# instance fields
.field private final account:Lorg/kore/kolab/notes/AccountInformation;

.field private coder:Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;

.field private final configurationParser:Lorg/kore/kolab/notes/KolabParser;

.field private remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/KolabParser;Lorg/kore/kolab/notes/AccountInformation;Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;)V
    .registers 5
    .param p1, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p2, "account"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p3, "rootFolder"    # Ljava/lang/String;
    .param p4, "configurationParser"    # Lorg/kore/kolab/notes/KolabParser;

    .prologue
    .line 69
    invoke-direct {p0, p1, p3}, Lorg/kore/kolab/notes/local/LocalNotesRepository;-><init>(Lorg/kore/kolab/notes/KolabParser;Ljava/lang/String;)V

    .line 70
    iput-object p2, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    .line 71
    iput-object p4, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->configurationParser:Lorg/kore/kolab/notes/KolabParser;

    .line 72
    return-void
.end method

.method private addAttachments(Lkorex/mail/internet/MimeMessage;Ljava/util/Collection;)V
    .registers 12
    .param p1, "message"    # Lkorex/mail/internet/MimeMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkorex/mail/internet/MimeMessage;",
            "Ljava/util/Collection",
            "<",
            "Lorg/kore/kolab/notes/Attachment;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    .local p2, "attachments":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/kore/kolab/notes/Attachment;>;"
    invoke-virtual {p1}, Lkorex/mail/internet/MimeMessage;->getContent()Ljava/lang/Object;

    move-result-object v1

    .line 378
    .local v1, "content":Ljava/lang/Object;
    instance-of v6, v1, Lkorex/mail/Multipart;

    if-eqz v6, :cond_52

    move-object v4, v1

    .line 379
    check-cast v4, Lkorex/mail/Multipart;

    .line 380
    .local v4, "multipart":Lkorex/mail/Multipart;
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_52

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Attachment;

    .line 381
    .local v0, "attachment":Lorg/kore/kolab/notes/Attachment;
    new-instance v5, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v5}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 382
    .local v5, "newContent":Lkorex/mail/internet/MimeBodyPart;
    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Ljava/lang/String;)V

    .line 383
    new-instance v2, Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;

    invoke-direct {v2, v0}, Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;-><init>(Lorg/kore/kolab/notes/Attachment;)V

    .line 384
    .local v2, "dataSource":Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;
    new-instance v3, Lkorex/activation/DataHandler;

    invoke-direct {v3, v2}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    .line 385
    .local v3, "handler":Lkorex/activation/DataHandler;
    invoke-virtual {v5, v3}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 386
    const-string v7, "Content-Disposition"

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getFileName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lkorex/mail/internet/MimeBodyPart;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    const-string v7, "Content-ID"

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Attachment;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Lkorex/mail/internet/MimeBodyPart;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 388
    const-string v7, "Content-Transfer-Encoding"

    const-string v8, "base64"

    invoke-virtual {v5, v7, v8}, Lkorex/mail/internet/MimeBodyPart;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    const/4 v7, 0x1

    invoke-virtual {v4, v5, v7}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;I)V

    goto :goto_f

    .line 392
    .end local v0    # "attachment":Lorg/kore/kolab/notes/Attachment;
    .end local v2    # "dataSource":Lorg/kore/kolab/notes/imap/KolabByteArrayDataSource;
    .end local v3    # "handler":Lkorex/activation/DataHandler;
    .end local v4    # "multipart":Lkorex/mail/Multipart;
    .end local v5    # "newContent":Lkorex/mail/internet/MimeBodyPart;
    :cond_52
    return-void
.end method

.method private createAttachmentContent(Lkorex/mail/BodyPart;Ljava/util/Map;)V
    .registers 11
    .param p1, "bodyPart"    # Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkorex/mail/BodyPart;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "attachmentContents":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    const/4 v7, 0x0

    .line 576
    const-string v6, "Content-ID"

    invoke-virtual {p1, v6}, Lkorex/mail/BodyPart;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 578
    .local v3, "header":[Ljava/lang/String;
    if-eqz v3, :cond_c

    array-length v6, v3

    if-nez v6, :cond_28

    .line 579
    :cond_c
    invoke-virtual {p1}, Lkorex/mail/BodyPart;->getFileName()Ljava/lang/String;

    move-result-object v0

    .line 584
    .local v0, "attId":Ljava/lang/String;
    :goto_10
    const/16 v6, 0x400

    new-array v1, v6, [B

    .line 585
    .local v1, "buffer":[B
    invoke-virtual {p1}, Lkorex/mail/BodyPart;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 587
    .local v4, "inputStream":Ljava/io/InputStream;
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 589
    .local v5, "output":Ljava/io/ByteArrayOutputStream;
    :goto_1d
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "bytes":I
    const/4 v6, -0x1

    if-eq v2, v6, :cond_2b

    .line 590
    invoke-virtual {v5, v1, v7, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1d

    .line 581
    .end local v0    # "attId":Ljava/lang/String;
    .end local v1    # "buffer":[B
    .end local v2    # "bytes":I
    .end local v4    # "inputStream":Ljava/io/InputStream;
    .end local v5    # "output":Ljava/io/ByteArrayOutputStream;
    :cond_28
    aget-object v0, v3, v7

    .restart local v0    # "attId":Ljava/lang/String;
    goto :goto_10

    .line 593
    .restart local v1    # "buffer":[B
    .restart local v2    # "bytes":I
    .restart local v4    # "inputStream":Ljava/io/InputStream;
    .restart local v5    # "output":Ljava/io/ByteArrayOutputStream;
    :cond_2b
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-interface {p2, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 595
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 596
    return-void
.end method

.method static createMessage(Lorg/kore/kolab/notes/AccountInformation;Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lkorex/activation/DataHandler;Ljava/lang/String;)Lkorex/mail/internet/MimeMessage;
    .registers 10
    .param p0, "account"    # Lorg/kore/kolab/notes/AccountInformation;
    .param p1, "ident"    # Lorg/kore/kolab/notes/Identification;
    .param p2, "audit"    # Lorg/kore/kolab/notes/AuditInformation;
    .param p3, "handler"    # Lkorex/activation/DataHandler;
    .param p4, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 396
    new-instance v0, Lkorex/mail/internet/MimeMessage;

    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v3

    invoke-static {v3}, Lkorex/mail/Session;->getInstance(Ljava/util/Properties;)Lkorex/mail/Session;

    move-result-object v3

    invoke-direct {v0, v3}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 398
    .local v0, "message":Lkorex/mail/internet/MimeMessage;
    new-instance v3, Lkorex/mail/internet/InternetAddress;

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getUsername()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/internet/InternetAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lkorex/mail/internet/MimeMessage;->setFrom(Lkorex/mail/Address;)V

    .line 399
    sget-object v3, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getUsername()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;)[Lkorex/mail/internet/InternetAddress;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lkorex/mail/internet/MimeMessage;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V

    .line 400
    invoke-virtual {p2}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v3

    invoke-virtual {v0, v3}, Lkorex/mail/internet/MimeMessage;->setSentDate(Ljava/util/Date;)V

    .line 401
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v3

    const-string v4, "UTF-8"

    invoke-virtual {v0, v3, v4}, Lkorex/mail/internet/MimeMessage;->setSubject(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const-string v3, "X-Kolab-Type"

    invoke-virtual {v0, v3, p4}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    const-string v3, "X-Kolab-Mime-Version"

    const-string v4, "3.0"

    invoke-virtual {v0, v3, v4}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    const-string v3, "User-Agent"

    const-string v4, "kolabnotes-java"

    invoke-virtual {v0, v3, v4}, Lkorex/mail/internet/MimeMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    new-instance v1, Lkorex/mail/internet/MimeMultipart;

    invoke-direct {v1}, Lkorex/mail/internet/MimeMultipart;-><init>()V

    .line 410
    .local v1, "multipart":Lkorex/mail/Multipart;
    new-instance v2, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v2}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 411
    .local v2, "textPart":Lkorex/mail/internet/MimeBodyPart;
    const-string v3, "This is a Kolab Groupware object.\nTo view this object you will need a Kolab Groupware Client.\nFor a list of Kolab Groupware Clients please visit:\nhttp://www.kolab.org"

    const-string v4, "UTF-8"

    invoke-virtual {v2, v3, v4}, Lkorex/mail/internet/MimeBodyPart;->setText(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    invoke-virtual {v1, v2}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 414
    invoke-static {v1, p3}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->setKolabXML(Lkorex/mail/Multipart;Lkorex/activation/DataHandler;)V

    .line 416
    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeMessage;->setContent(Lkorex/mail/Multipart;)V

    .line 417
    invoke-virtual {v0}, Lkorex/mail/internet/MimeMessage;->saveChanges()V

    .line 421
    return-object v0
.end method

.method private fillAttachmentOfNote(Lorg/kore/kolab/notes/Note;Ljava/util/Map;)V
    .registers 7
    .param p1, "note"    # Lorg/kore/kolab/notes/Note;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/kore/kolab/notes/Note;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    .prologue
    .line 564
    .local p2, "attachmentContents":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    if-eqz p1, :cond_2c

    .line 565
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 566
    .local v0, "attContent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/kore/kolab/notes/Note;->getAttachment(Ljava/lang/String;)Lorg/kore/kolab/notes/Attachment;

    move-result-object v1

    .line 568
    .local v1, "attachment":Lorg/kore/kolab/notes/Attachment;
    if-eqz v1, :cond_a

    .line 569
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Attachment;->setData([B)V

    goto :goto_a

    .line 573
    .end local v0    # "attContent":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v1    # "attachment":Lorg/kore/kolab/notes/Attachment;
    :cond_2c
    return-void
.end method

.method private loadFromMessage(Lkorex/mail/Multipart;Lorg/kore/kolab/notes/Notebook;Ljava/util/Map;)V
    .registers 9
    .param p1, "content"    # Lkorex/mail/Multipart;
    .param p2, "notebook"    # Lorg/kore/kolab/notes/Notebook;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkorex/mail/Multipart;",
            "Lorg/kore/kolab/notes/Notebook;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 550
    .local p3, "attachmentContents":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    const/4 v2, 0x0

    .line 551
    .local v2, "note":Lorg/kore/kolab/notes/Note;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p1}, Lkorex/mail/Multipart;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_23

    .line 552
    invoke-virtual {p1, v1}, Lkorex/mail/Multipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v0

    .line 553
    .local v0, "bodyPart":Lkorex/mail/BodyPart;
    invoke-virtual {v0}, Lkorex/mail/BodyPart;->getContentType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "APPLICATION/VND.KOLAB+XML"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 554
    invoke-direct {p0, v0, p2}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->loadNoteFromMessage(Lkorex/mail/BodyPart;Lorg/kore/kolab/notes/Notebook;)Lorg/kore/kolab/notes/Note;

    move-result-object v2

    .line 551
    :goto_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 556
    :cond_1f
    invoke-direct {p0, v0, p3}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->createAttachmentContent(Lkorex/mail/BodyPart;Ljava/util/Map;)V

    goto :goto_1c

    .line 560
    .end local v0    # "bodyPart":Lkorex/mail/BodyPart;
    :cond_23
    invoke-direct {p0, v2, p3}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->fillAttachmentOfNote(Lorg/kore/kolab/notes/Note;Ljava/util/Map;)V

    .line 561
    return-void
.end method

.method private loadNoteFromMessage(Lkorex/mail/BodyPart;Lorg/kore/kolab/notes/Notebook;)Lorg/kore/kolab/notes/Note;
    .registers 11
    .param p1, "bodyPart"    # Lkorex/mail/BodyPart;
    .param p2, "notebook"    # Lorg/kore/kolab/notes/Notebook;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 599
    invoke-virtual {p1}, Lkorex/mail/BodyPart;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 600
    .local v0, "inputStream":Ljava/io/InputStream;
    iget-object v4, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-interface {v4, v0}, Lorg/kore/kolab/notes/KolabParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/kore/kolab/notes/Note;

    .line 601
    .local v1, "note":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 602
    invoke-virtual {p2, v1}, Lorg/kore/kolab/notes/Notebook;->addNote(Lorg/kore/kolab/notes/Note;)V

    .line 603
    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v4

    invoke-virtual {v4}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->addNote(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V

    .line 605
    iget-object v4, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v5

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/kore/kolab/notes/imap/RemoteTags;->getTagsFromNote(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v3

    .line 606
    .local v3, "tagsFromNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_49

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 607
    .local v2, "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    const/4 v5, 0x1

    new-array v5, v5, [Lorg/kore/kolab/notes/Tag;

    const/4 v6, 0x0

    invoke-virtual {v2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v1, v5}, Lorg/kore/kolab/notes/Note;->addCategories([Lorg/kore/kolab/notes/Tag;)V

    goto :goto_2f

    .line 609
    .end local v2    # "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :cond_49
    return-object v1
.end method

.method public static openConnection(Lorg/kore/kolab/notes/AccountInformation;)Lkorex/mail/Store;
    .registers 12
    .param p0, "info"    # Lorg/kore/kolab/notes/AccountInformation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Lkorex/mail/NoSuchProviderException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 145
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 147
    .local v3, "props":Ljava/util/Properties;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->isSSLEnabled()Z

    move-result v6

    if-eqz v6, :cond_13

    .line 148
    const-string v6, "mail.imaps.ssl.trust"

    const-string v7, "*"

    invoke-virtual {v3, v6, v7}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    :cond_13
    const/4 v5, 0x0

    .line 153
    .local v5, "store":Lcom/sun/mail/imap/IMAPStore;
    const/4 v6, 0x0

    :try_start_15
    invoke-static {v3, v6}, Lkorex/mail/Session;->getInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;

    move-result-object v4

    .line 154
    .local v4, "session":Lkorex/mail/Session;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->isSSLEnabled()Z

    move-result v6

    if-eqz v6, :cond_b7

    const-string v6, "imaps"

    invoke-virtual {v4, v6}, Lkorex/mail/Session;->getStore(Ljava/lang/String;)Lkorex/mail/Store;

    move-result-object v6

    :goto_25
    check-cast v6, Lcom/sun/mail/imap/IMAPStore;

    move-object v0, v6

    check-cast v0, Lcom/sun/mail/imap/IMAPStore;

    move-object v5, v0

    .line 155
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getPort()I

    move-result v7

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getPassword()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/sun/mail/imap/IMAPStore;->connect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_3e
    .catch Lkorex/mail/MessagingException; {:try_start_15 .. :try_end_3e} :catch_bf

    .line 172
    :goto_3e
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v6

    if-eqz v6, :cond_b6

    .line 173
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 174
    .local v1, "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "name"

    const-string v7, "/Kolabnotes-java"

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    const-string v6, "version"

    const-string v7, "3.3.4"

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const-string v6, "os"

    const-string v7, "os.name"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    const-string v6, "support-url"

    const-string v7, "https://github.com/konradrenner/kolabnotes-java/issues"

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    const-string v6, "os-version"

    const-string v7, "os.version"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    const-string v6, "vendor"

    const-string v7, "kolabnotes-java"

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    const-string v6, "environment"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "java.vendor"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Java "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "java.version"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "java.vendor.url"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-virtual {v5, v1}, Lcom/sun/mail/imap/IMAPStore;->id(Ljava/util/Map;)Ljava/util/Map;

    .line 185
    .end local v1    # "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_b6
    return-object v5

    .line 154
    :cond_b7
    :try_start_b7
    const-string v6, "imap"

    invoke-virtual {v4, v6}, Lkorex/mail/Session;->getStore(Ljava/lang/String;)Lkorex/mail/Store;
    :try_end_bc
    .catch Lkorex/mail/MessagingException; {:try_start_b7 .. :try_end_bc} :catch_bf

    move-result-object v6

    goto/16 :goto_25

    .line 156
    .end local v4    # "session":Lkorex/mail/Session;
    :catch_bf
    move-exception v2

    .line 158
    .local v2, "e":Lkorex/mail/MessagingException;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->isSSLEnabled()Z

    move-result v6

    if-eqz v6, :cond_fa

    .line 159
    new-instance v3, Ljava/util/Properties;

    .end local v3    # "props":Ljava/util/Properties;
    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 160
    .restart local v3    # "props":Ljava/util/Properties;
    const-string v6, "mail.imap.ssl.trust"

    const-string v7, "*"

    invoke-virtual {v3, v6, v7}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    const-string v6, "mail.imap.starttls.enable"

    const-string v7, "true"

    invoke-virtual {v3, v6, v7}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-static {v3, v10}, Lkorex/mail/Session;->getInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;

    move-result-object v4

    .line 165
    .restart local v4    # "session":Lkorex/mail/Session;
    const-string v6, "imap"

    invoke-virtual {v4, v6}, Lkorex/mail/Session;->getStore(Ljava/lang/String;)Lkorex/mail/Store;

    move-result-object v5

    .end local v5    # "store":Lcom/sun/mail/imap/IMAPStore;
    check-cast v5, Lcom/sun/mail/imap/IMAPStore;

    .line 166
    .restart local v5    # "store":Lcom/sun/mail/imap/IMAPStore;
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getPort()I

    move-result v7

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getUsername()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AccountInformation;->getPassword()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/sun/mail/imap/IMAPStore;->connect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3e

    .line 168
    .end local v4    # "session":Lkorex/mail/Session;
    :cond_fa
    throw v2
.end method

.method static setKolabXML(Lkorex/mail/Multipart;Lkorex/activation/DataHandler;)V
    .registers 7
    .param p0, "content"    # Lkorex/mail/Multipart;
    .param p1, "handler"    # Lkorex/activation/DataHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 425
    if-nez p0, :cond_3

    .line 439
    :goto_2
    return-void

    .line 428
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    invoke-virtual {p0}, Lkorex/mail/Multipart;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_20

    .line 429
    invoke-virtual {p0, v1}, Lkorex/mail/Multipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v0

    .line 430
    .local v0, "bodyPart":Lkorex/mail/BodyPart;
    invoke-virtual {v0}, Lkorex/mail/BodyPart;->getContentType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "APPLICATION/VND.KOLAB+XML"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 431
    invoke-virtual {p0, v1}, Lkorex/mail/Multipart;->removeBodyPart(I)V

    .line 428
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 435
    .end local v0    # "bodyPart":Lkorex/mail/BodyPart;
    :cond_20
    new-instance v2, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v2}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 436
    .local v2, "newContent":Lkorex/mail/internet/MimeBodyPart;
    const-string v3, "kolab.xml"

    invoke-virtual {v2, v3}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Ljava/lang/String;)V

    .line 437
    invoke-virtual {v2, p1}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V

    .line 438
    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;I)V

    goto :goto_2
.end method


# virtual methods
.method protected addNote(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "note"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 464
    invoke-super {p0, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->addNote(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V

    .line 465
    return-void
.end method

.method protected addNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "notebook"    # Lorg/kore/kolab/notes/Notebook;

    .prologue
    .line 459
    invoke-super {p0, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->addNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V

    .line 460
    return-void
.end method

.method public fillUnloadedNote(Lorg/kore/kolab/notes/Note;)V
    .registers 7
    .param p1, "note"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 357
    invoke-virtual {p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->disableChangeListening()V

    .line 359
    iget-object v2, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->notesCache:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/kore/kolab/notes/Note;

    .line 361
    .local v1, "unloaded":Lorg/kore/kolab/notes/Note;
    if-eqz v1, :cond_8d

    const-string v2, "NOT_LOADED"

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8d

    .line 362
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getClassification()Lorg/kore/kolab/notes/Note$Classification;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->setClassification(Lorg/kore/kolab/notes/Note$Classification;)V

    .line 363
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->setColor(Lorg/kore/kolab/notes/Color;)V

    .line 364
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->setDescription(Ljava/lang/String;)V

    .line 365
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->setSummary(Ljava/lang/String;)V

    .line 366
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getCategories()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getCategories()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Lorg/kore/kolab/notes/Tag;

    invoke-interface {v2, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/kore/kolab/notes/Tag;

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->addCategories([Lorg/kore/kolab/notes/Tag;)V

    .line 367
    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v3

    invoke-virtual {v3}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/kore/kolab/notes/AuditInformation;->setLastModificationDate(J)V

    .line 368
    invoke-virtual {v1}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/AuditInformation;->getCreationDate()Ljava/sql/Timestamp;

    move-result-object v3

    invoke-virtual {v3}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lorg/kore/kolab/notes/AuditInformation;->setCreationDate(J)V

    .line 369
    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getAttachments()Ljava/util/Collection;

    move-result-object v0

    .line 370
    .local v0, "attachments":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/kore/kolab/notes/Attachment;>;"
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    new-array v2, v2, [Lorg/kore/kolab/notes/Attachment;

    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/kore/kolab/notes/Attachment;

    invoke-virtual {v1, v2}, Lorg/kore/kolab/notes/Note;->addAttachments([Lorg/kore/kolab/notes/Attachment;)V

    .line 373
    .end local v0    # "attachments":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/kore/kolab/notes/Attachment;>;"
    :cond_8d
    invoke-virtual {p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->enableChangeListening()V

    .line 374
    return-void
.end method

.method findMessage(Ljava/lang/String;[Lkorex/mail/Message;)Lkorex/mail/internet/MimeMessage;
    .registers 7
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "messages"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 442
    array-length v2, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_1c

    aget-object v0, p2, v1

    .line 443
    .local v0, "m":Lkorex/mail/Message;
    invoke-virtual {v0}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_19

    invoke-virtual {v0}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 444
    check-cast v0, Lkorex/mail/internet/MimeMessage;

    .line 447
    .end local v0    # "m":Lkorex/mail/Message;
    :goto_18
    return-object v0

    .line 442
    .restart local v0    # "m":Lkorex/mail/Message;
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 447
    .end local v0    # "m":Lkorex/mail/Message;
    :cond_1c
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public getRemoteTags()Lorg/kore/kolab/notes/imap/RemoteTags;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    return-object v0
.end method

.method protected initCache()V
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 453
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->refresh([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V

    .line 455
    :cond_e
    return-void
.end method

.method varargs initNotesFromFolder(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;Z[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)Lorg/kore/kolab/notes/Notebook;
    .registers 29
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "fetchProfile"    # Lkorex/mail/FetchProfile;
    .param p3, "parseDate"    # Ljava/util/Date;
    .param p4, "sharedFolder"    # Z
    .param p5, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Folder;->getMessages()[Lkorex/mail/Message;

    move-result-object v10

    .line 503
    .local v10, "messages":[Lkorex/mail/Message;
    sget-object v19, Lkorex/mail/FetchProfile$Item;->CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 504
    sget-object v19, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 505
    sget-object v19, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 506
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v10, v1}, Lkorex/mail/Folder;->fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V

    .line 508
    new-instance v16, Ljava/sql/Timestamp;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    move-object/from16 v0, v16

    move-wide/from16 v1, v19

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    .line 509
    .local v16, "now":Ljava/sql/Timestamp;
    new-instance v7, Lorg/kore/kolab/notes/Identification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v19

    const-string v20, "kolabnotes-java"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v7, v0, v1}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    .local v7, "id":Lorg/kore/kolab/notes/Identification;
    new-instance v4, Lorg/kore/kolab/notes/AuditInformation;

    move-object/from16 v0, v16

    move-object/from16 v1, v16

    invoke-direct {v4, v0, v1}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 513
    .local v4, "audit":Lorg/kore/kolab/notes/AuditInformation;
    if-eqz p4, :cond_d4

    .line 514
    new-instance v11, Lorg/kore/kolab/notes/SharedNotebook;

    sget-object v19, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v11, v7, v4, v0, v1}, Lorg/kore/kolab/notes/SharedNotebook;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 515
    .local v11, "nb":Lorg/kore/kolab/notes/SharedNotebook;
    move-object v15, v11

    .line 519
    .end local v11    # "nb":Lorg/kore/kolab/notes/SharedNotebook;
    .local v15, "notebook":Lorg/kore/kolab/notes/Notebook;
    :goto_61
    invoke-virtual {v15}, Lorg/kore/kolab/notes/Notebook;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v15}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->addNotebook(Ljava/lang/String;Lorg/kore/kolab/notes/Notebook;)V

    .line 521
    array-length v0, v10

    move/from16 v20, v0

    const/16 v19, 0x0

    :goto_75
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_113

    aget-object v9, v10, v19

    .line 522
    .local v9, "m":Lkorex/mail/Message;
    invoke-virtual {v9}, Lkorex/mail/Message;->getSentDate()Ljava/util/Date;

    move-result-object v17

    .line 523
    .local v17, "sentDate":Ljava/util/Date;
    if-eqz p3, :cond_e5

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v21

    if-eqz v21, :cond_e5

    .line 524
    new-instance v18, Ljava/sql/Timestamp;

    invoke-virtual/range {v17 .. v17}, Ljava/util/Date;->getTime()J

    move-result-wide v21

    move-object/from16 v0, v18

    move-wide/from16 v1, v21

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    .line 525
    .local v18, "tst":Ljava/sql/Timestamp;
    new-instance v14, Lorg/kore/kolab/notes/Identification;

    invoke-virtual {v9}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v21

    const-string v22, "kolabnotes-java"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v14, v0, v1}, Lorg/kore/kolab/notes/Identification;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    .local v14, "noteLoadedId":Lorg/kore/kolab/notes/Identification;
    new-instance v12, Lorg/kore/kolab/notes/AuditInformation;

    move-object/from16 v0, v18

    move-object/from16 v1, v18

    invoke-direct {v12, v0, v1}, Lorg/kore/kolab/notes/AuditInformation;-><init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V

    .line 527
    .local v12, "notLoadedAudit":Lorg/kore/kolab/notes/AuditInformation;
    new-instance v13, Lorg/kore/kolab/notes/Note;

    sget-object v21, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    const-string v22, "NOT_LOADED"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v13, v14, v12, v0, v1}, Lorg/kore/kolab/notes/Note;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .line 529
    .local v13, "note":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v15, v13}, Lorg/kore/kolab/notes/Notebook;->addNote(Lorg/kore/kolab/notes/Note;)V

    .line 530
    invoke-virtual {v13}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v13}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->addNote(Ljava/lang/String;Lorg/kore/kolab/notes/Note;)V

    .line 521
    .end local v12    # "notLoadedAudit":Lorg/kore/kolab/notes/AuditInformation;
    .end local v13    # "note":Lorg/kore/kolab/notes/Note;
    .end local v14    # "noteLoadedId":Lorg/kore/kolab/notes/Identification;
    .end local v18    # "tst":Ljava/sql/Timestamp;
    :goto_d1
    add-int/lit8 v19, v19, 0x1

    goto :goto_75

    .line 517
    .end local v9    # "m":Lkorex/mail/Message;
    .end local v15    # "notebook":Lorg/kore/kolab/notes/Notebook;
    .end local v17    # "sentDate":Ljava/util/Date;
    :cond_d4
    new-instance v15, Lorg/kore/kolab/notes/Notebook;

    sget-object v19, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Folder;->getName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v15, v7, v4, v0, v1}, Lorg/kore/kolab/notes/Notebook;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Note$Classification;Ljava/lang/String;)V

    .restart local v15    # "notebook":Lorg/kore/kolab/notes/Notebook;
    goto/16 :goto_61

    .line 533
    .restart local v9    # "m":Lkorex/mail/Message;
    .restart local v17    # "sentDate":Ljava/util/Date;
    :cond_e5
    invoke-virtual {v9}, Lkorex/mail/Message;->getContent()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkorex/mail/Multipart;

    .line 535
    .local v5, "content":Lkorex/mail/Multipart;
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 537
    .local v3, "attachmentContents":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v15, v3}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->loadFromMessage(Lkorex/mail/Multipart;Lorg/kore/kolab/notes/Notebook;Ljava/util/Map;)V
    :try_end_f5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_f5} :catch_f6

    goto :goto_d1

    .line 541
    .end local v3    # "attachmentContents":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    .end local v4    # "audit":Lorg/kore/kolab/notes/AuditInformation;
    .end local v5    # "content":Lkorex/mail/Multipart;
    .end local v7    # "id":Lorg/kore/kolab/notes/Identification;
    .end local v9    # "m":Lkorex/mail/Message;
    .end local v10    # "messages":[Lkorex/mail/Message;
    .end local v15    # "notebook":Lorg/kore/kolab/notes/Notebook;
    .end local v16    # "now":Ljava/sql/Timestamp;
    .end local v17    # "sentDate":Ljava/util/Date;
    :catch_f6
    move-exception v6

    .line 542
    .local v6, "e":Ljava/lang/Exception;
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v20, v0

    const/16 v19, 0x0

    :goto_fe
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_112

    aget-object v8, p5, v19

    .line 543
    .local v8, "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v8, v0, v6}, Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;->onFolderSyncException(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 542
    add-int/lit8 v19, v19, 0x1

    goto :goto_fe

    .line 545
    .end local v8    # "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    :cond_112
    const/4 v15, 0x0

    .end local v6    # "e":Ljava/lang/Exception;
    :cond_113
    return-object v15
.end method

.method initNotesFromFolderWithAnnotationCheck(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;)V
    .registers 11
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "fetchProfile"    # Lkorex/mail/FetchProfile;
    .param p3, "parseDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 468
    instance-of v0, p1, Lcom/sun/mail/imap/IMAPFolder;

    if-eqz v0, :cond_1b

    .line 469
    new-instance v6, Lorg/kore/kolab/notes/imap/GetMetadataCommand;

    invoke-virtual {p1}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0}, Lorg/kore/kolab/notes/imap/GetMetadataCommand;-><init>(Ljava/lang/String;)V

    .local v6, "metadataCommand":Lorg/kore/kolab/notes/imap/GetMetadataCommand;
    move-object v0, p1

    .line 470
    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    invoke-virtual {v0, v6}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 473
    invoke-virtual {v6}, Lorg/kore/kolab/notes/imap/GetMetadataCommand;->isNotesFolder()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 479
    .end local v6    # "metadataCommand":Lorg/kore/kolab/notes/imap/GetMetadataCommand;
    :goto_1a
    return-void

    .line 478
    :cond_1b
    new-array v5, v4, [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolder(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;Z[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)Lorg/kore/kolab/notes/Notebook;

    goto :goto_1a
.end method

.method varargs initSharedFolders(Lkorex/mail/Store;Lkorex/mail/FetchProfile;Ljava/util/Date;ZZ[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .registers 24
    .param p1, "store"    # Lkorex/mail/Store;
    .param p2, "fetchProfile"    # Lkorex/mail/FetchProfile;
    .param p3, "modificationDate"    # Ljava/util/Date;
    .param p4, "folderAnnotationEnabled"    # Z
    .param p5, "sharedFolderEnabled"    # Z
    .param p6, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 189
    if-eqz p4, :cond_4

    if-nez p5, :cond_5

    .line 224
    :cond_4
    return-void

    .line 194
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Store;->getDefaultFolder()Lkorex/mail/Folder;

    move-result-object v8

    .line 195
    .local v8, "defaultFolder":Lkorex/mail/Folder;
    const-string v1, "*"

    invoke-virtual {v8, v1}, Lkorex/mail/Folder;->list(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v10

    .line 197
    .local v10, "list":[Lkorex/mail/Folder;
    array-length v0, v10

    move/from16 v16, v0

    const/4 v1, 0x0

    move v15, v1

    :goto_14
    move/from16 v0, v16

    if-ge v15, v0, :cond_4

    aget-object v2, v10, v15

    .line 198
    .local v2, "folder":Lkorex/mail/Folder;
    instance-of v1, v2, Lcom/sun/mail/imap/IMAPFolder;

    if-eqz v1, :cond_76

    move-object v9, v2

    .line 199
    check-cast v9, Lcom/sun/mail/imap/IMAPFolder;

    .line 200
    .local v9, "imapFolder":Lcom/sun/mail/imap/IMAPFolder;
    new-instance v12, Lorg/kore/kolab/notes/imap/GetSharedFolderCommand;

    invoke-virtual {v2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v12, v1}, Lorg/kore/kolab/notes/imap/GetSharedFolderCommand;-><init>(Ljava/lang/String;)V

    .line 201
    .local v12, "metadataCommand":Lorg/kore/kolab/notes/imap/GetSharedFolderCommand;
    invoke-virtual {v9, v12}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 204
    invoke-virtual {v12}, Lorg/kore/kolab/notes/imap/GetSharedFolderCommand;->isSharedNotesFolder()Z

    move-result v1

    if-eqz v1, :cond_76

    .line 206
    new-instance v13, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;

    invoke-virtual {v2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v13, v1}, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;-><init>(Ljava/lang/String;)V

    .line 207
    .local v13, "permissionsCommand":Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;
    invoke-virtual {v9, v13}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 209
    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Lkorex/mail/Folder;->open(I)V

    .line 210
    const/4 v5, 0x1

    const/4 v1, 0x0

    new-array v6, v1, [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-virtual/range {v1 .. v6}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolder(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;Z[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)Lorg/kore/kolab/notes/Notebook;

    move-result-object v7

    .line 212
    .local v7, "book":Lorg/kore/kolab/notes/Notebook;
    if-eqz v7, :cond_64

    move-object v14, v7

    .line 213
    check-cast v14, Lorg/kore/kolab/notes/SharedNotebook;

    .line 214
    .local v14, "shared":Lorg/kore/kolab/notes/SharedNotebook;
    invoke-virtual {v13}, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isIsNoteCreationAllowed()Z

    move-result v1

    invoke-virtual {v14, v1}, Lorg/kore/kolab/notes/SharedNotebook;->setNoteCreationAllowed(Z)V

    .line 215
    invoke-virtual {v13}, Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;->isIsNoteModificationAllowed()Z

    move-result v1

    invoke-virtual {v14, v1}, Lorg/kore/kolab/notes/SharedNotebook;->setNoteModificationAllowed(Z)V

    .line 218
    .end local v14    # "shared":Lorg/kore/kolab/notes/SharedNotebook;
    :cond_64
    move-object/from16 v0, p6

    array-length v3, v0

    const/4 v1, 0x0

    :goto_68
    if-ge v1, v3, :cond_76

    aget-object v11, p6, v1

    .line 219
    .local v11, "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    invoke-virtual {v2}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v11, v4}, Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;->onSyncUpdate(Ljava/lang/String;)V

    .line 218
    add-int/lit8 v1, v1, 0x1

    goto :goto_68

    .line 197
    .end local v7    # "book":Lorg/kore/kolab/notes/Notebook;
    .end local v9    # "imapFolder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v11    # "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    .end local v12    # "metadataCommand":Lorg/kore/kolab/notes/imap/GetSharedFolderCommand;
    .end local v13    # "permissionsCommand":Lorg/kore/kolab/notes/imap/GetFolderPermissionsCommand;
    :cond_76
    add-int/lit8 v1, v15, 0x1

    move v15, v1

    goto :goto_14
.end method

.method public varargs merge(Ljava/util/Map;[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .registers 4
    .param p2, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/event/EventListener$Type;",
            ">;[",
            "Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "eventTypes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;>;"
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 86
    invoke-virtual {p0, p2}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->merge([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V

    .line 87
    return-void
.end method

.method public varargs merge([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .registers 32
    .param p1, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    .prologue
    .line 228
    invoke-virtual/range {p0 .. p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initCache()V

    .line 229
    invoke-virtual/range {p0 .. p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->disableChangeListening()V

    .line 232
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->openConnection(Lorg/kore/kolab/notes/AccountInformation;)Lkorex/mail/Store;

    move-result-object v20

    .line 234
    .local v20, "store":Lkorex/mail/Store;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v22, v0

    if-nez v22, :cond_2f

    .line 235
    new-instance v22, Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->configurationParser:Lorg/kore/kolab/notes/KolabParser;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    move-object/from16 v24, v0

    invoke-direct/range {v22 .. v24}, Lorg/kore/kolab/notes/imap/RemoteTags;-><init>(Lorg/kore/kolab/notes/KolabParser;Lorg/kore/kolab/notes/AccountInformation;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    .line 237
    :cond_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 240
    new-instance v17, Ljava/util/ArrayList;

    invoke-virtual/range {p0 .. p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->getNotebooks()Ljava/util/Collection;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 242
    .local v17, "notebooks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Notebook;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->deletedNotebookCache:Ljava/util/Map;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 245
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/Store;->getDefaultFolder()Lkorex/mail/Folder;

    move-result-object v6

    check-cast v6, Lcom/sun/mail/imap/IMAPFolder;

    .line 248
    .local v6, "defaultFolder":Lcom/sun/mail/imap/IMAPFolder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->rootfolder:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lkorex/mail/Store;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v19

    check-cast v19, Lcom/sun/mail/imap/IMAPFolder;

    .line 250
    .local v19, "rootFolder":Lcom/sun/mail/imap/IMAPFolder;
    new-instance v7, Lkorex/mail/Flags;

    sget-object v22, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    move-object/from16 v0, v22

    invoke-direct {v7, v0}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags$Flag;)V

    .line 253
    .local v7, "deleted":Lkorex/mail/Flags;
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_7d
    :goto_7d
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2cc

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/kore/kolab/notes/Notebook;
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_89} :catch_2dc
    .catchall {:try_start_6 .. :try_end_89} :catchall_25e

    .line 256
    .local v5, "book":Lorg/kore/kolab/notes/Notebook;
    :try_start_89
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->rootfolder:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_db

    .line 257
    move-object/from16 v11, v19

    .line 264
    .local v11, "folder":Lcom/sun/mail/imap/IMAPFolder;
    :goto_9f
    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->getEvent(Ljava/lang/String;)Lorg/kore/kolab/notes/event/EventListener$Type;

    move-result-object v10

    .line 265
    .local v10, "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    if-eqz v10, :cond_134

    .line 266
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_fd

    .line 267
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->delete(Z)Z
    :try_end_be
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_be} :catch_bf
    .catchall {:try_start_89 .. :try_end_be} :catchall_25e

    goto :goto_7d

    .line 337
    .end local v10    # "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    .end local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    :catch_bf
    move-exception v9

    .line 338
    .local v9, "e":Ljava/lang/Exception;
    :try_start_c0
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v24, v0

    const/16 v22, 0x0

    :goto_c7
    move/from16 v0, v22

    move/from16 v1, v24

    if-ge v0, v1, :cond_7d

    aget-object v12, p1, v22

    .line 339
    .local v12, "list":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-interface {v12, v0, v9}, Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;->onFolderSyncException(Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_d8
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_d8} :catch_2dc
    .catchall {:try_start_c0 .. :try_end_d8} :catchall_25e

    .line 338
    add-int/lit8 v22, v22, 0x1

    goto :goto_c7

    .line 258
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v12    # "list":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    :cond_db
    :try_start_db
    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->isShared()Z

    move-result v22

    if-eqz v22, :cond_ee

    .line 259
    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v6, v0}, Lcom/sun/mail/imap/IMAPFolder;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v11

    check-cast v11, Lcom/sun/mail/imap/IMAPFolder;

    .restart local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    goto :goto_9f

    .line 261
    .end local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    :cond_ee
    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getSummary()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/sun/mail/imap/IMAPFolder;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v11

    check-cast v11, Lcom/sun/mail/imap/IMAPFolder;

    .restart local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    goto :goto_9f

    .line 269
    .restart local v10    # "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    :cond_fd
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-eq v10, v0, :cond_109

    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_134

    .line 270
    :cond_109
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_263

    .line 271
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->create(I)Z

    .line 277
    :goto_116
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v22

    if-eqz v22, :cond_134

    .line 278
    new-instance v22, Lorg/kore/kolab/notes/imap/SetMetadataCommand;

    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPFolder;->getFullName()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/kore/kolab/notes/imap/SetMetadataCommand;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 284
    :cond_134
    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPFolder;->exists()Z

    move-result v22

    if-eqz v22, :cond_7d

    .line 285
    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPFolder;->isOpen()Z

    move-result v22

    if-nez v22, :cond_147

    .line 286
    const/16 v22, 0x2

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->open(I)V

    .line 288
    :cond_147
    new-instance v18, Ljava/util/ArrayList;

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getNotes()Ljava/util/Collection;

    move-result-object v22

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 289
    .local v18, "notes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Note;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->deletedNotesCache:Ljava/util/Map;

    move-object/from16 v22, v0

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Notebook;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 290
    .local v8, "deletedNotes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    if-eqz v8, :cond_179

    .line 291
    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v22

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 293
    :cond_179
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 294
    .local v15, "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :cond_182
    :goto_182
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2ac

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/kore/kolab/notes/Note;

    .line 295
    .local v16, "note":Lorg/kore/kolab/notes/Note;
    invoke-virtual {v11}, Lcom/sun/mail/imap/IMAPFolder;->getMessages()[Lkorex/mail/Message;

    move-result-object v14

    .line 297
    .local v14, "messages":[Lkorex/mail/Message;
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->getEvent(Ljava/lang/String;)Lorg/kore/kolab/notes/event/EventListener$Type;

    move-result-object v10

    .line 300
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_1cf

    .line 301
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v21

    .line 303
    .local v21, "uid":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v14}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->findMessage(Ljava/lang/String;[Lkorex/mail/Message;)Lkorex/mail/internet/MimeMessage;

    move-result-object v13

    .line 305
    .local v13, "message":Lkorex/mail/internet/MimeMessage;
    if-eqz v13, :cond_1cf

    .line 306
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v22, v0

    const/16 v25, 0x0

    aput-object v13, v22, v25

    const/16 v25, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v11, v0, v7, v1}, Lcom/sun/mail/imap/IMAPFolder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V

    .line 310
    .end local v13    # "message":Lkorex/mail/internet/MimeMessage;
    .end local v21    # "uid":Ljava/lang/String;
    :cond_1cf
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-eq v10, v0, :cond_1db

    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_268

    .line 312
    :cond_1db
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    move-object/from16 v22, v0

    .line 313
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v25

    .line 314
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v26

    new-instance v27, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;

    const-string v28, "APPLICATION/VND.KOLAB+XML"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->parser:Lorg/kore/kolab/notes/KolabParser;

    move-object/from16 v29, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v16

    move-object/from16 v2, v28

    move-object/from16 v3, v29

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;)V

    const-string v28, "application/x-vnd.kolab.note"

    .line 312
    move-object/from16 v0, v22

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    move-object/from16 v4, v28

    invoke-static {v0, v1, v2, v3, v4}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->createMessage(Lorg/kore/kolab/notes/AccountInformation;Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lkorex/activation/DataHandler;Ljava/lang/String;)Lkorex/mail/internet/MimeMessage;

    move-result-object v13

    .line 318
    .restart local v13    # "message":Lkorex/mail/internet/MimeMessage;
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getAttachments()Ljava/util/Collection;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v13, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->addAttachments(Lkorex/mail/internet/MimeMessage;Ljava/util/Collection;)V

    .line 320
    invoke-virtual {v15, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v21

    .line 323
    .restart local v21    # "uid":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/kore/kolab/notes/imap/RemoteTags;->removeTags(Ljava/lang/String;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v25, v0

    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getCategories()Ljava/util/Set;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getCategories()Ljava/util/Set;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Ljava/util/Set;->size()I

    move-result v26

    move/from16 v0, v26

    new-array v0, v0, [Lorg/kore/kolab/notes/Tag;

    move-object/from16 v26, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v22

    check-cast v22, [Lorg/kore/kolab/notes/Tag;

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/kore/kolab/notes/imap/RemoteTags;->attachTags(Ljava/lang/String;[Lorg/kore/kolab/notes/Tag;)V
    :try_end_25c
    .catch Ljava/lang/Exception; {:try_start_db .. :try_end_25c} :catch_bf
    .catchall {:try_start_db .. :try_end_25c} :catchall_25e

    goto/16 :goto_182

    .line 351
    .end local v5    # "book":Lorg/kore/kolab/notes/Notebook;
    .end local v6    # "defaultFolder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v7    # "deleted":Lkorex/mail/Flags;
    .end local v8    # "deletedNotes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    .end local v10    # "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    .end local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v13    # "message":Lkorex/mail/internet/MimeMessage;
    .end local v14    # "messages":[Lkorex/mail/Message;
    .end local v15    # "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    .end local v16    # "note":Lorg/kore/kolab/notes/Note;
    .end local v17    # "notebooks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Notebook;>;"
    .end local v18    # "notes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Note;>;"
    .end local v19    # "rootFolder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v20    # "store":Lkorex/mail/Store;
    .end local v21    # "uid":Ljava/lang/String;
    :catchall_25e
    move-exception v22

    invoke-virtual/range {p0 .. p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->enableChangeListening()V

    throw v22

    .line 274
    .restart local v5    # "book":Lorg/kore/kolab/notes/Notebook;
    .restart local v6    # "defaultFolder":Lcom/sun/mail/imap/IMAPFolder;
    .restart local v7    # "deleted":Lkorex/mail/Flags;
    .restart local v10    # "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    .restart local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    .restart local v17    # "notebooks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Notebook;>;"
    .restart local v19    # "rootFolder":Lcom/sun/mail/imap/IMAPFolder;
    .restart local v20    # "store":Lkorex/mail/Store;
    :cond_263
    :try_start_263
    invoke-virtual {v11, v11}, Lcom/sun/mail/imap/IMAPFolder;->renameTo(Lkorex/mail/Folder;)Z

    goto/16 :goto_116

    .line 325
    .restart local v8    # "deletedNotes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    .restart local v14    # "messages":[Lkorex/mail/Message;
    .restart local v15    # "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    .restart local v16    # "note":Lorg/kore/kolab/notes/Note;
    .restart local v18    # "notes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Note;>;"
    :cond_268
    sget-object v22, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    move-object/from16 v0, v22

    if-ne v10, v0, :cond_182

    .line 326
    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v14}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->findMessage(Ljava/lang/String;[Lkorex/mail/Message;)Lkorex/mail/internet/MimeMessage;

    move-result-object v13

    .line 327
    .local v13, "message":Lkorex/mail/Message;
    if-eqz v13, :cond_295

    .line 328
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v22, v0

    const/16 v25, 0x0

    aput-object v13, v22, v25

    const/16 v25, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v11, v0, v7, v1}, Lcom/sun/mail/imap/IMAPFolder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V

    .line 331
    :cond_295
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v22, v0

    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/kore/kolab/notes/imap/RemoteTags;->removeTags(Ljava/lang/String;)V

    goto/16 :goto_182

    .line 334
    .end local v13    # "message":Lkorex/mail/Message;
    .end local v14    # "messages":[Lkorex/mail/Message;
    .end local v16    # "note":Lorg/kore/kolab/notes/Note;
    :cond_2ac
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v22

    move/from16 v0, v22

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v22

    check-cast v22, [Lkorex/mail/Message;

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->addMessages([Lkorex/mail/Message;)[Lkorex/mail/Message;

    .line 335
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Lcom/sun/mail/imap/IMAPFolder;->close(Z)V
    :try_end_2ca
    .catch Ljava/lang/Exception; {:try_start_263 .. :try_end_2ca} :catch_bf
    .catchall {:try_start_263 .. :try_end_2ca} :catchall_25e

    goto/16 :goto_7d

    .line 345
    .end local v5    # "book":Lorg/kore/kolab/notes/Notebook;
    .end local v8    # "deletedNotes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/kore/kolab/notes/Note;>;"
    .end local v10    # "event":Lorg/kore/kolab/notes/event/EventListener$Type;
    .end local v11    # "folder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v15    # "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    .end local v18    # "notes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Note;>;"
    :cond_2cc
    :try_start_2cc
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/kore/kolab/notes/imap/RemoteTags;->merge()V

    .line 347
    invoke-virtual/range {v20 .. v20}, Lkorex/mail/Store;->close()V
    :try_end_2d8
    .catch Ljava/lang/Exception; {:try_start_2cc .. :try_end_2d8} :catch_2dc
    .catchall {:try_start_2cc .. :try_end_2d8} :catchall_25e

    .line 351
    invoke-virtual/range {p0 .. p0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->enableChangeListening()V

    .line 353
    return-void

    .line 348
    .end local v6    # "defaultFolder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v7    # "deleted":Lkorex/mail/Flags;
    .end local v17    # "notebooks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/kore/kolab/notes/Notebook;>;"
    .end local v19    # "rootFolder":Lcom/sun/mail/imap/IMAPFolder;
    .end local v20    # "store":Lkorex/mail/Store;
    :catch_2dc
    move-exception v9

    .line 349
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_2dd
    new-instance v22, Ljava/lang/IllegalStateException;

    move-object/from16 v0, v22

    invoke-direct {v0, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v22
    :try_end_2e5
    .catchall {:try_start_2dd .. :try_end_2e5} :catchall_25e
.end method

.method public noteCompletelyLoaded(Lorg/kore/kolab/notes/Note;)Z
    .registers 4
    .param p1, "note"    # Lorg/kore/kolab/notes/Note;

    .prologue
    .line 483
    const-string v0, "NOT_LOADED"

    invoke-virtual {p1}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public varargs refresh(Ljava/util/Date;[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .registers 21
    .param p1, "modificationDate"    # Ljava/util/Date;
    .param p2, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    .prologue
    .line 96
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->notesCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 97
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->notebookCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 99
    :try_start_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-static {v2}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->openConnection(Lorg/kore/kolab/notes/AccountInformation;)Lkorex/mail/Store;

    move-result-object v17

    .line 101
    .local v17, "store":Lkorex/mail/Store;
    new-instance v2, Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->configurationParser:Lorg/kore/kolab/notes/KolabParser;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-direct {v2, v5, v7}, Lorg/kore/kolab/notes/imap/RemoteTags;-><init>(Lorg/kore/kolab/notes/KolabParser;Lorg/kore/kolab/notes/AccountInformation;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    .line 102
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->remoteTags:Lorg/kore/kolab/notes/imap/RemoteTags;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 104
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->rootfolder:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Lkorex/mail/Store;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v3

    .line 105
    .local v3, "rFolder":Lkorex/mail/Folder;
    new-instance v4, Lkorex/mail/FetchProfile;

    invoke-direct {v4}, Lkorex/mail/FetchProfile;-><init>()V

    .line 107
    .local v4, "fetchProfile":Lkorex/mail/FetchProfile;
    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Lkorex/mail/Folder;->open(I)V

    .line 108
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v2

    if-eqz v2, :cond_8a

    .line 109
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v3, v4, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolderWithAnnotationCheck(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;)V

    .line 114
    :goto_54
    const-string v2, "*"

    invoke-virtual {v3, v2}, Lkorex/mail/Folder;->list(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v14

    .line 116
    .local v14, "allFolders":[Lkorex/mail/Folder;
    array-length v12, v14

    const/4 v2, 0x0

    move v11, v2

    :goto_5d
    if-ge v11, v12, :cond_b3

    aget-object v6, v14, v11

    .line 117
    .local v6, "folder":Lkorex/mail/Folder;
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Lkorex/mail/Folder;->open(I)V

    .line 118
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v2

    if-eqz v2, :cond_a2

    .line 119
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v6, v4, v1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolderWithAnnotationCheck(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;)V

    .line 124
    :goto_76
    move-object/from16 v0, p2

    array-length v5, v0

    const/4 v2, 0x0

    :goto_7a
    if-ge v2, v5, :cond_af

    aget-object v16, p2, v2

    .line 125
    .local v16, "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    invoke-virtual {v6}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-interface {v0, v7}, Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;->onSyncUpdate(Ljava/lang/String;)V

    .line 124
    add-int/lit8 v2, v2, 0x1

    goto :goto_7a

    .line 111
    .end local v6    # "folder":Lkorex/mail/Folder;
    .end local v14    # "allFolders":[Lkorex/mail/Folder;
    .end local v16    # "listen":Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;
    :cond_8a
    const/4 v6, 0x0

    const/4 v2, 0x0

    new-array v7, v2, [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    move-object/from16 v2, p0

    move-object/from16 v5, p1

    invoke-virtual/range {v2 .. v7}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolder(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;Z[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)Lorg/kore/kolab/notes/Notebook;
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_95} :catch_96

    goto :goto_54

    .line 138
    .end local v3    # "rFolder":Lkorex/mail/Folder;
    .end local v4    # "fetchProfile":Lkorex/mail/FetchProfile;
    .end local v17    # "store":Lkorex/mail/Store;
    :catch_96
    move-exception v15

    .line 139
    .local v15, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v15}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 140
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 121
    .end local v15    # "e":Ljava/lang/Exception;
    .restart local v3    # "rFolder":Lkorex/mail/Folder;
    .restart local v4    # "fetchProfile":Lkorex/mail/FetchProfile;
    .restart local v6    # "folder":Lkorex/mail/Folder;
    .restart local v14    # "allFolders":[Lkorex/mail/Folder;
    .restart local v17    # "store":Lkorex/mail/Store;
    :cond_a2
    const/4 v9, 0x0

    const/4 v2, 0x0

    :try_start_a4
    new-array v10, v2, [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    move-object/from16 v5, p0

    move-object v7, v4

    move-object/from16 v8, p1

    invoke-virtual/range {v5 .. v10}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initNotesFromFolder(Lkorex/mail/Folder;Lkorex/mail/FetchProfile;Ljava/util/Date;Z[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)Lorg/kore/kolab/notes/Notebook;

    goto :goto_76

    .line 116
    :cond_af
    add-int/lit8 v2, v11, 0x1

    move v11, v2

    goto :goto_5d

    .line 130
    .end local v6    # "folder":Lkorex/mail/Folder;
    :cond_b3
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v11

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AccountInformation;->isSharedFoldersEnabled()Z

    move-result v12

    move-object/from16 v7, p0

    move-object/from16 v8, v17

    move-object v9, v4

    move-object/from16 v10, p1

    move-object/from16 v13, p2

    invoke-virtual/range {v7 .. v13}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->initSharedFolders(Lkorex/mail/Store;Lkorex/mail/FetchProfile;Ljava/util/Date;ZZ[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V

    .line 133
    invoke-virtual/range {v17 .. v17}, Lkorex/mail/Store;->close()V

    .line 135
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->eventCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 136
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->deletedNotebookCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 137
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->deletedNotesCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_e7} :catch_96

    .line 142
    return-void
.end method

.method public varargs refresh([Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V
    .registers 3
    .param p1, "listener"    # [Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->refresh(Ljava/util/Date;[Lorg/kore/kolab/notes/RemoteNotesRepository$Listener;)V

    .line 92
    return-void
.end method

.method public setBase64Coder(Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;)V
    .registers 2
    .param p1, "coder"    # Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->coder:Lorg/kore/kolab/notes/RemoteNotesRepository$Base64Coder;

    .line 77
    return-void
.end method
