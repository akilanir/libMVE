.class public Lkorex/mail/internet/InternetHeaders;
.super Ljava/lang/Object;
.source "InternetHeaders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/internet/InternetHeaders$MatchEnum;,
        Lkorex/mail/internet/InternetHeaders$InternetHeader;
    }
.end annotation


# static fields
.field private static final ignoreWhitespaceLines:Z


# instance fields
.field protected headers:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 87
    const-string v0, "mail.mime.ignorewhitespacelines"

    const/4 v1, 0x0

    .line 88
    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lkorex/mail/internet/InternetHeaders;->ignoreWhitespaceLines:Z

    .line 87
    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 282
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    .line 283
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Return-Path"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 284
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Received"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-Date"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-From"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-Sender"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-To"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 289
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-Cc"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 290
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-Bcc"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Resent-Message-Id"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Date"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "From"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Sender"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Reply-To"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "To"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Cc"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Bcc"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Message-Id"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "In-Reply-To"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "References"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Subject"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Comments"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Keywords"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 305
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Errors-To"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "MIME-Version"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Content-Type"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Content-Transfer-Encoding"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Content-MD5"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, ":"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Content-Length"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    iget-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    const-string v2, "Status"

    invoke-direct {v1, v2, v3}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 331
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    .line 332
    invoke-virtual {p0, p1}, Lkorex/mail/internet/InternetHeaders;->load(Ljava/io/InputStream;)V

    .line 333
    return-void
.end method

.method private static final isEmpty(Ljava/lang/String;)Z
    .registers 2
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 392
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_14

    sget-boolean v0, Lkorex/mail/internet/InternetHeaders;->ignoreWhitespaceLines:Z

    if-eqz v0, :cond_16

    .line 393
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 505
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 506
    .local v3, "pos":I
    const-string v4, "Received"

    .line 507
    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_16

    const-string v4, "Return-Path"

    .line 508
    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    :cond_16
    const/4 v0, 0x1

    .line 509
    .local v0, "addReverse":Z
    :goto_17
    if-eqz v0, :cond_1a

    .line 510
    const/4 v3, 0x0

    .line 511
    :cond_1a
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v2, v4, -0x1

    .local v2, "i":I
    :goto_22
    if-ltz v2, :cond_5a

    .line 512
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 513
    .local v1, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 514
    if-eqz v0, :cond_4d

    .line 515
    move v3, v2

    .line 522
    :cond_39
    if-nez v0, :cond_48

    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_48

    .line 523
    move v3, v2

    .line 511
    :cond_48
    add-int/lit8 v2, v2, -0x1

    goto :goto_22

    .line 508
    .end local v0    # "addReverse":Z
    .end local v1    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    .end local v2    # "i":I
    :cond_4b
    const/4 v0, 0x0

    goto :goto_17

    .line 517
    .restart local v0    # "addReverse":Z
    .restart local v1    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    .restart local v2    # "i":I
    :cond_4d
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    add-int/lit8 v5, v2, 0x1

    new-instance v6, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    invoke-direct {v6, p1, p2}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 526
    .end local v1    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :goto_59
    return-void

    .line 525
    :cond_5a
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v5, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    invoke-direct {v5, p1, p2}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v3, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_59
.end method

.method public addHeaderLine(Ljava/lang/String;)V
    .registers 7
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 585
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 586
    .local v0, "c":C
    const/16 v3, 0x20

    if-eq v0, v3, :cond_d

    const/16 v3, 0x9

    if-ne v0, v3, :cond_39

    .line 587
    :cond_d
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    .line 588
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 589
    .local v2, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v2, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 598
    .end local v0    # "c":C
    .end local v2    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :goto_38
    return-void

    .line 591
    .restart local v0    # "c":C
    :cond_39
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    new-instance v4, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    invoke-direct {v4, p1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_43
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_1 .. :try_end_43} :catch_44
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_43} :catch_46

    goto :goto_38

    .line 592
    .end local v0    # "c":C
    :catch_44
    move-exception v1

    .line 594
    .local v1, "e":Ljava/lang/StringIndexOutOfBoundsException;
    goto :goto_38

    .line 595
    .end local v1    # "e":Ljava/lang/StringIndexOutOfBoundsException;
    :catch_46
    move-exception v3

    goto :goto_38
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 606
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeaders()Ljava/util/Enumeration;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 550
    new-instance v0, Lkorex/mail/internet/InternetHeaders$MatchEnum;

    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lkorex/mail/internet/InternetHeaders$MatchEnum;-><init>(Ljava/util/List;[Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 436
    invoke-virtual {p0, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 438
    .local v2, "s":[Ljava/lang/String;
    if-nez v2, :cond_9

    .line 439
    const/4 v3, 0x0

    .line 449
    :goto_8
    return-object v3

    .line 441
    :cond_9
    array-length v3, v2

    const/4 v4, 0x1

    if-eq v3, v4, :cond_f

    if-nez p2, :cond_12

    .line 442
    :cond_f
    aget-object v3, v2, v5

    goto :goto_8

    .line 444
    :cond_12
    new-instance v1, Ljava/lang/StringBuffer;

    aget-object v3, v2, v5

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 445
    .local v1, "r":Ljava/lang/StringBuffer;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1a
    array-length v3, v2

    if-ge v0, v3, :cond_28

    .line 446
    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 447
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 445
    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    .line 449
    :cond_28
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_8
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 405
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 407
    .local v0, "e":Ljava/util/Iterator;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 409
    .local v3, "v":Ljava/util/List;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 410
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 411
    .local v1, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v4, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    if-eqz v4, :cond_b

    .line 412
    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 415
    .end local v1    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :cond_2d
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_35

    .line 416
    const/4 v2, 0x0

    .line 420
    :goto_34
    return-object v2

    .line 418
    :cond_35
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v2, v4, [Ljava/lang/String;

    .line 419
    .local v2, "r":[Ljava/lang/String;
    invoke-interface {v3, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    move-object v2, v4

    check-cast v2, [Ljava/lang/String;

    .line 420
    goto :goto_34
.end method

.method public getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 5
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 616
    new-instance v0, Lkorex/mail/internet/InternetHeaders$MatchEnum;

    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-direct {v0, v1, p1, v2, v2}, Lkorex/mail/internet/InternetHeaders$MatchEnum;-><init>(Ljava/util/List;[Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 6
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 560
    new-instance v0, Lkorex/mail/internet/InternetHeaders$MatchEnum;

    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, p1, v2, v3}, Lkorex/mail/internet/InternetHeaders$MatchEnum;-><init>(Ljava/util/List;[Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 6
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 626
    new-instance v0, Lkorex/mail/internet/InternetHeaders$MatchEnum;

    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, p1, v2, v3}, Lkorex/mail/internet/InternetHeaders$MatchEnum;-><init>(Ljava/util/List;[Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 5
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 570
    new-instance v0, Lkorex/mail/internet/InternetHeaders$MatchEnum;

    iget-object v1, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-direct {v0, v1, p1, v2, v2}, Lkorex/mail/internet/InternetHeaders$MatchEnum;-><init>(Ljava/util/List;[Ljava/lang/String;ZZ)V

    return-object v0
.end method

.method public load(Ljava/io/InputStream;)V
    .registers 9
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 353
    new-instance v3, Lcom/sun/mail/util/LineInputStream;

    invoke-direct {v3, p1}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V

    .line 354
    .local v3, "lis":Lcom/sun/mail/util/LineInputStream;
    const/4 v4, 0x0

    .line 356
    .local v4, "prevline":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 361
    .local v2, "lineBuffer":Ljava/lang/StringBuffer;
    :cond_b
    :try_start_b
    invoke-virtual {v3}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 362
    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_38

    const-string v5, " "

    .line 363
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_21

    const-string v5, "\t"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_38

    .line 365
    :cond_21
    if-eqz v4, :cond_27

    .line 366
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 367
    const/4 v4, 0x0

    .line 369
    :cond_27
    const-string v5, "\r\n"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 370
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    :goto_2f
    if-eqz v1, :cond_37

    invoke-static {v1}, Lkorex/mail/internet/InternetHeaders;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 386
    :cond_37
    return-void

    .line 373
    :cond_38
    if-eqz v4, :cond_3f

    .line 374
    invoke-virtual {p0, v4}, Lkorex/mail/internet/InternetHeaders;->addHeaderLine(Ljava/lang/String;)V

    .line 380
    :cond_3d
    :goto_3d
    move-object v4, v1

    goto :goto_2f

    .line 375
    :cond_3f
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    if-lez v5, :cond_3d

    .line 377
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lkorex/mail/internet/InternetHeaders;->addHeaderLine(Ljava/lang/String;)V

    .line 378
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_50
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_50} :catch_51

    goto :goto_3d

    .line 383
    .end local v1    # "line":Ljava/lang/String;
    :catch_51
    move-exception v0

    .line 384
    .local v0, "ioex":Ljava/io/IOException;
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "Error in input stream"

    invoke-direct {v5, v6, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5
.end method

.method public removeHeader(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 533
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_21

    .line 534
    iget-object v2, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 535
    .local v0, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 536
    const/4 v2, 0x0

    iput-object v2, v0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 533
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 541
    .end local v0    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :cond_21
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 463
    const/4 v0, 0x0

    .line 465
    .local v0, "found":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_74

    .line 466
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;

    .line 467
    .local v1, "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    invoke-virtual {v1}, Lkorex/mail/internet/InternetHeaders$InternetHeader;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 468
    if-nez v0, :cond_6c

    .line 470
    iget-object v4, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    if-eqz v4, :cond_52

    iget-object v4, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    const/16 v5, 0x3a

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .local v3, "j":I
    if-ltz v3, :cond_52

    .line 471
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    const/4 v6, 0x0

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 476
    .end local v3    # "j":I
    :goto_4e
    const/4 v0, 0x1

    .line 465
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 474
    :cond_52
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    goto :goto_4e

    .line 478
    :cond_6c
    iget-object v4, p0, Lkorex/mail/internet/InternetHeaders;->headers:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 479
    add-int/lit8 v2, v2, -0x1

    goto :goto_4f

    .line 484
    .end local v1    # "h":Lkorex/mail/internet/InternetHeaders$InternetHeader;
    :cond_74
    if-nez v0, :cond_79

    .line 485
    invoke-virtual {p0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    :cond_79
    return-void
.end method
