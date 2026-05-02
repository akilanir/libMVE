.class public Lcom/sun/mail/util/logging/MailHandler;
.super Ljava/util/logging/Handler;
.source "MailHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;,
        Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;,
        Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final EMPTY_FILTERS:[Ljava/util/logging/Filter;

.field private static final EMPTY_FORMATTERS:[Ljava/util/logging/Formatter;

.field private static final GET_AND_SET_CCL:Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

.field private static final MIN_HEADER_SIZE:I = 0x400

.field private static final MUTEX:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/logging/Level;",
            ">;"
        }
    .end annotation
.end field

.field private static final MUTEX_PUBLISH:Ljava/util/logging/Level;

.field private static final MUTEX_REPORT:Ljava/util/logging/Level;

.field private static final offValue:I


# instance fields
.field private volatile attachmentFilters:[Ljava/util/logging/Filter;

.field private attachmentFormatters:[Ljava/util/logging/Formatter;

.field private attachmentNames:[Ljava/util/logging/Formatter;

.field private auth:Lkorex/mail/Authenticator;

.field private capacity:I

.field private comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;"
        }
    .end annotation
.end field

.field private contentTypes:Lkorex/activation/FileTypeMap;

.field private data:[Ljava/util/logging/LogRecord;

.field private isWriting:Z

.field private mailProps:Ljava/util/Properties;

.field private pushFilter:Ljava/util/logging/Filter;

.field private pushLevel:Ljava/util/logging/Level;

.field private volatile sealed:Z

.field private session:Lkorex/mail/Session;

.field private size:I

.field private subjectFormatter:Ljava/util/logging/Formatter;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 359
    const-class v0, Lcom/sun/mail/util/logging/MailHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_35

    const/4 v0, 0x1

    :goto_a
    sput-boolean v0, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    .line 363
    new-array v0, v1, [Ljava/util/logging/Filter;

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->EMPTY_FILTERS:[Ljava/util/logging/Filter;

    .line 367
    new-array v0, v1, [Ljava/util/logging/Formatter;

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->EMPTY_FORMATTERS:[Ljava/util/logging/Formatter;

    .line 375
    sget-object v0, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-virtual {v0}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    sput v0, Lcom/sun/mail/util/logging/MailHandler;->offValue:I

    .line 380
    new-instance v0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

    const-class v1, Lcom/sun/mail/util/logging/MailHandler;

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->GET_AND_SET_CCL:Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

    .line 389
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    .line 393
    sget-object v0, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_PUBLISH:Ljava/util/logging/Level;

    .line 397
    sget-object v0, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    sput-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_REPORT:Ljava/util/logging/Level;

    return-void

    :cond_35
    move v0, v1

    .line 359
    goto :goto_a
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 495
    invoke-direct {p0}, Ljava/util/logging/Handler;-><init>()V

    .line 496
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Properties;

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->init(Ljava/util/Properties;)V

    .line 497
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->sealed:Z

    .line 498
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 509
    invoke-direct {p0}, Ljava/util/logging/Handler;-><init>()V

    .line 510
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Properties;

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->init(Ljava/util/Properties;)V

    .line 511
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->sealed:Z

    .line 512
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setCapacity0(I)V

    .line 513
    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .registers 3
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 525
    invoke-direct {p0}, Ljava/util/logging/Handler;-><init>()V

    .line 526
    if-nez p1, :cond_b

    .line 527
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 529
    :cond_b
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->init(Ljava/util/Properties;)V

    .line 530
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->sealed:Z

    .line 531
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setMailProperties0(Ljava/util/Properties;)V

    .line 532
    return-void
.end method

.method private appendContentLang(Lkorex/mail/internet/MimePart;Ljava/util/Locale;)V
    .registers 10
    .param p1, "p"    # Lkorex/mail/internet/MimePart;
    .param p2, "l"    # Ljava/util/Locale;

    .prologue
    .line 3071
    :try_start_0
    invoke-static {p2}, Lcom/sun/mail/util/logging/LogManagerProperties;->toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 3072
    .local v3, "lang":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_1c

    .line 3073
    const-string v5, "Content-Language"

    const/4 v6, 0x0

    invoke-interface {p1, v5, v6}, Lkorex/mail/internet/MimePart;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3074
    .local v1, "header":Ljava/lang/String;
    invoke-static {v1}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 3075
    const-string v5, "Content-Language"

    invoke-interface {p1, v5, v3}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3108
    .end local v1    # "header":Ljava/lang/String;
    .end local v3    # "lang":Ljava/lang/String;
    :cond_1c
    :goto_1c
    return-void

    .line 3076
    .restart local v1    # "header":Ljava/lang/String;
    .restart local v3    # "lang":Ljava/lang/String;
    :cond_1d
    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1c

    .line 3077
    const-string v5, ","

    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3078
    const/4 v2, 0x0

    .line 3079
    .local v2, "idx":I
    :cond_2a
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    const/4 v5, -0x1

    if-le v2, v5, :cond_44

    .line 3080
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v2, v5

    .line 3081
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eq v2, v5, :cond_44

    .line 3082
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2c

    if-ne v5, v6, :cond_2a

    .line 3087
    :cond_44
    if-gez v2, :cond_1c

    .line 3088
    const-string v5, "\r\n\t"

    invoke-virtual {v1, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    .line 3089
    .local v4, "len":I
    if-gez v4, :cond_77

    .line 3090
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v4, v5, 0x14

    .line 3096
    :goto_54
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v4

    const/16 v6, 0x4c

    if-le v5, v6, :cond_7f

    .line 3097
    const-string v5, "\r\n\t"

    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 3101
    :goto_67
    const-string v5, "Content-Language"

    invoke-interface {p1, v5, v1}, Lkorex/mail/internet/MimePart;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6c
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_6c} :catch_6d

    goto :goto_1c

    .line 3105
    .end local v1    # "header":Ljava/lang/String;
    .end local v2    # "idx":I
    .end local v3    # "lang":Ljava/lang/String;
    .end local v4    # "len":I
    :catch_6d
    move-exception v0

    .line 3106
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x5

    invoke-virtual {p0, v5, v0, v6}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_1c

    .line 3092
    .end local v0    # "ME":Lkorex/mail/MessagingException;
    .restart local v1    # "header":Ljava/lang/String;
    .restart local v2    # "idx":I
    .restart local v3    # "lang":Ljava/lang/String;
    .restart local v4    # "len":I
    :cond_77
    :try_start_77
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v4

    add-int/lit8 v4, v5, 0x8

    goto :goto_54

    .line 3099
    :cond_7f
    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    :try_end_82
    .catch Lkorex/mail/MessagingException; {:try_start_77 .. :try_end_82} :catch_6d

    move-result-object v1

    goto :goto_67
.end method

.method private appendFileName(Lkorex/mail/Part;Ljava/lang/String;)V
    .registers 4
    .param p1, "part"    # Lkorex/mail/Part;
    .param p2, "chunk"    # Ljava/lang/String;

    .prologue
    .line 2971
    if-eqz p2, :cond_c

    .line 2972
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_b

    .line 2973
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/util/logging/MailHandler;->appendFileName0(Lkorex/mail/Part;Ljava/lang/String;)V

    .line 2978
    :cond_b
    :goto_b
    return-void

    .line 2976
    :cond_c
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->reportNullError(I)V

    goto :goto_b
.end method

.method private appendFileName0(Lkorex/mail/Part;Ljava/lang/String;)V
    .registers 7
    .param p1, "part"    # Lkorex/mail/Part;
    .param p2, "chunk"    # Ljava/lang/String;

    .prologue
    .line 2989
    :try_start_0
    const-string v2, "[\\x00-\\x1F\\x7F]+"

    const-string v3, ""

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2990
    invoke-interface {p1}, Lkorex/mail/Part;->getFileName()Ljava/lang/String;

    move-result-object v1

    .line 2991
    .local v1, "old":Ljava/lang/String;
    if-eqz v1, :cond_16

    invoke-virtual {v1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_12
    invoke-interface {p1, v2}, Lkorex/mail/Part;->setFileName(Ljava/lang/String;)V
    :try_end_15
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_15} :catch_18

    .line 2995
    .end local v1    # "old":Ljava/lang/String;
    :goto_15
    return-void

    .restart local v1    # "old":Ljava/lang/String;
    :cond_16
    move-object v2, p2

    .line 2991
    goto :goto_12

    .line 2992
    .end local v1    # "old":Ljava/lang/String;
    :catch_18
    move-exception v0

    .line 2993
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {p0, v2, v0, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_15
.end method

.method private appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "chunk"    # Ljava/lang/String;

    .prologue
    .line 3003
    if-eqz p2, :cond_c

    .line 3004
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_b

    .line 3005
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject0(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 3010
    :cond_b
    :goto_b
    return-void

    .line 3008
    :cond_c
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->reportNullError(I)V

    goto :goto_b
.end method

.method private appendSubject0(Lkorex/mail/Message;Ljava/lang/String;)V
    .registers 8
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "chunk"    # Ljava/lang/String;

    .prologue
    .line 3021
    :try_start_0
    const-string v3, "[\\x00-\\x1F\\x7F]+"

    const-string v4, ""

    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 3022
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncodingName()Ljava/lang/String;

    move-result-object v1

    .line 3023
    .local v1, "encoding":Ljava/lang/String;
    invoke-virtual {p1}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v2

    .line 3024
    .local v2, "old":Ljava/lang/String;
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_28

    instance-of v3, p1, Lkorex/mail/internet/MimeMessage;

    if-nez v3, :cond_28

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
    :try_end_1e
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_1e} :catch_1e

    .line 3027
    .end local v1    # "encoding":Ljava/lang/String;
    .end local v2    # "old":Ljava/lang/String;
    .end local p1    # "msg":Lkorex/mail/Message;
    :catch_1e
    move-exception v0

    .line 3028
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3030
    .end local v0    # "ME":Lkorex/mail/MessagingException;
    :goto_27
    return-void

    .line 3025
    .restart local v1    # "encoding":Ljava/lang/String;
    .restart local v2    # "old":Ljava/lang/String;
    .restart local p1    # "msg":Lkorex/mail/Message;
    :cond_28
    :try_start_28
    check-cast p1, Lkorex/mail/internet/MimeMessage;

    .end local p1    # "msg":Lkorex/mail/Message;
    if-eqz v2, :cond_38

    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3026
    :goto_30
    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3025
    invoke-virtual {p1, v3, v4}, Lkorex/mail/internet/MimeMessage;->setSubject(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_37
    .catch Lkorex/mail/MessagingException; {:try_start_28 .. :try_end_37} :catch_1e

    goto :goto_27

    :cond_38
    move-object v3, p2

    goto :goto_30
.end method

.method private static atIndexMsg(I)Ljava/lang/String;
    .registers 3
    .param p0, "i"    # I

    .prologue
    .line 3576
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "At index: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static attach(Lkorex/mail/MessagingException;Ljava/lang/Exception;)Lkorex/mail/MessagingException;
    .registers 4
    .param p0, "required"    # Lkorex/mail/MessagingException;
    .param p1, "optional"    # Ljava/lang/Exception;

    .prologue
    .line 3559
    if-eqz p1, :cond_16

    invoke-virtual {p0, p1}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 3560
    instance-of v1, p1, Lkorex/mail/MessagingException;

    if-eqz v1, :cond_16

    move-object v0, p1

    .line 3561
    check-cast v0, Lkorex/mail/MessagingException;

    .line 3562
    .local v0, "head":Lkorex/mail/MessagingException;
    invoke-virtual {v0, p0}, Lkorex/mail/MessagingException;->setNextException(Ljava/lang/Exception;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 3567
    .end local v0    # "head":Lkorex/mail/MessagingException;
    :goto_15
    return-object v0

    :cond_16
    move-object v0, p0

    goto :goto_15
.end method

.method private static attachmentMismatch(II)Ljava/lang/RuntimeException;
    .registers 4
    .param p0, "expected"    # I
    .param p1, "found"    # I

    .prologue
    .line 3546
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Attachments mismatched, expected "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " but given "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    return-object v0
.end method

.method private static attachmentMismatch(Ljava/lang/String;)Ljava/lang/RuntimeException;
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 3536
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0, p0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private contentWithEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 1396
    sget-boolean v2, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_c

    if-nez p2, :cond_c

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1398
    :cond_c
    :try_start_c
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-direct {v1, p1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 1399
    .local v1, "ct":Lkorex/mail/internet/ContentType;
    const-string v2, "charset"

    invoke-static {p2}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lkorex/mail/internet/ContentType;->setParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 1400
    invoke-virtual {v1}, Lkorex/mail/internet/ContentType;->toString()Ljava/lang/String;

    move-result-object p2

    .line 1401
    invoke-static {p2}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z
    :try_end_21
    .catch Lkorex/mail/MessagingException; {:try_start_c .. :try_end_21} :catch_26

    move-result v2

    if-nez v2, :cond_25

    .line 1402
    move-object p1, p2

    .line 1407
    .end local v1    # "ct":Lkorex/mail/internet/ContentType;
    :cond_25
    :goto_25
    return-object p1

    .line 1404
    :catch_26
    move-exception v0

    .line 1405
    .local v0, "ME":Lkorex/mail/MessagingException;
    const/4 v2, 0x5

    invoke-virtual {p0, p1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_25
.end method

.method private static copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;
    .registers 3
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    .prologue
    .line 1531
    .local p0, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method private static copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;
    .registers 6
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            ">([TU;I",
            "Ljava/lang/Class",
            "<+[TT;>;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "a":[Ljava/lang/Object;, "[TU;"
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<+[TT;>;"
    const/4 v2, 0x0

    .line 1546
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    .line 1547
    .local v0, "copy":[Ljava/lang/Object;, "[TT;"
    array-length v1, p0

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1548
    return-object v0
.end method

.method private createBodyPart()Lkorex/mail/internet/MimeBodyPart;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2872
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2873
    :cond_10
    new-instance v0, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v0}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 2874
    .local v0, "part":Lkorex/mail/internet/MimeBodyPart;
    const-string v1, "inline"

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Ljava/lang/String;)V

    .line 2875
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getFormatter()Ljava/util/logging/Formatter;

    move-result-object v1

    .line 2876
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 2875
    invoke-direct {p0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->descriptionFrom(Ljava/util/logging/Formatter;Ljava/util/logging/Filter;Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Ljava/lang/String;)V

    .line 2877
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setAcceptLang(Lkorex/mail/Part;)V

    .line 2878
    return-object v0
.end method

.method private createBodyPart(I)Lkorex/mail/internet/MimeBodyPart;
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 2890
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2891
    :cond_10
    new-instance v0, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v0}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 2892
    .local v0, "part":Lkorex/mail/internet/MimeBodyPart;
    const-string v1, "attachment"

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Ljava/lang/String;)V

    .line 2893
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    aget-object v1, v1, p1

    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    aget-object v2, v2, p1

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    aget-object v3, v3, p1

    invoke-direct {p0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->descriptionFrom(Ljava/util/logging/Formatter;Ljava/util/logging/Filter;Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Ljava/lang/String;)V

    .line 2897
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setAcceptLang(Lkorex/mail/Part;)V

    .line 2898
    return-object v0
.end method

.method private descriptionFrom(Ljava/util/Comparator;Ljava/util/logging/Level;Ljava/util/logging/Filter;)Ljava/lang/String;
    .registers 6
    .param p2, "l"    # Ljava/util/logging/Level;
    .param p3, "f"    # Ljava/util/logging/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<*>;",
            "Ljava/util/logging/Level;",
            "Ljava/util/logging/Filter;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2913
    .local p1, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Sorted using "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p1, :cond_3a

    const-string v0, "no comparator"

    .line 2914
    :goto_f
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pushed when "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/util/logging/Level;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p3, :cond_43

    const-string v0, "no push filter"

    .line 2916
    :goto_2b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2914
    :cond_3a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    .line 2916
    :cond_43
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_2b
.end method

.method private descriptionFrom(Ljava/util/logging/Formatter;Ljava/util/logging/Filter;Ljava/util/logging/Formatter;)Ljava/lang/String;
    .registers 6
    .param p1, "f"    # Ljava/util/logging/Formatter;
    .param p2, "filter"    # Ljava/util/logging/Filter;
    .param p3, "name"    # Ljava/util/logging/Formatter;

    .prologue
    .line 2927
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Formatted using "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->getClassId(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", filtered with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p2, :cond_3a

    const-string v0, "no filter"

    .line 2929
    :goto_1d
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", and named by "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2930
    invoke-direct {p0, p3}, Lcom/sun/mail/util/logging/MailHandler;->getClassId(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 2929
    :cond_3a
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method private static emptyFilterArray()[Ljava/util/logging/Filter;
    .registers 1

    .prologue
    .line 1458
    sget-object v0, Lcom/sun/mail/util/logging/MailHandler;->EMPTY_FILTERS:[Ljava/util/logging/Filter;

    return-object v0
.end method

.method private static emptyFormatterArray()[Ljava/util/logging/Formatter;
    .registers 1

    .prologue
    .line 1450
    sget-object v0, Lcom/sun/mail/util/logging/MailHandler;->EMPTY_FORMATTERS:[Ljava/util/logging/Formatter;

    return-object v0
.end method

.method private envelopeFor(Lkorex/mail/Message;Z)V
    .registers 6
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "priority"    # Z

    .prologue
    .line 2844
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setAcceptLang(Lkorex/mail/Part;)V

    .line 2845
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setFrom(Lkorex/mail/Message;)V

    .line 2846
    const-string v1, "mail.to"

    sget-object v2, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-direct {p0, p1, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->setRecipient(Lkorex/mail/Message;Ljava/lang/String;Lkorex/mail/Message$RecipientType;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 2847
    sget-object v1, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    invoke-direct {p0, p1, v1}, Lcom/sun/mail/util/logging/MailHandler;->setDefaultRecipient(Lkorex/mail/Message;Lkorex/mail/Message$RecipientType;)V

    .line 2849
    :cond_15
    const-string v1, "mail.cc"

    sget-object v2, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    invoke-direct {p0, p1, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->setRecipient(Lkorex/mail/Message;Ljava/lang/String;Lkorex/mail/Message$RecipientType;)Z

    .line 2850
    const-string v1, "mail.bcc"

    sget-object v2, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    invoke-direct {p0, p1, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->setRecipient(Lkorex/mail/Message;Ljava/lang/String;Lkorex/mail/Message$RecipientType;)Z

    .line 2851
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setReplyTo(Lkorex/mail/Message;)V

    .line 2852
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setSender(Lkorex/mail/Message;)V

    .line 2853
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setMailer(Lkorex/mail/Message;)V

    .line 2854
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setAutoSubmitted(Lkorex/mail/Message;)V

    .line 2855
    if-eqz p2, :cond_34

    .line 2856
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setPriority(Lkorex/mail/Message;)V

    .line 2860
    :cond_34
    :try_start_34
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1, v1}, Lkorex/mail/Message;->setSentDate(Ljava/util/Date;)V
    :try_end_3c
    .catch Lkorex/mail/MessagingException; {:try_start_34 .. :try_end_3c} :catch_3d

    .line 2864
    :goto_3c
    return-void

    .line 2861
    :catch_3d
    move-exception v0

    .line 2862
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_3c
.end method

.method private fixUpAttachmentFilters()Z
    .registers 7

    .prologue
    .line 1495
    sget-boolean v5, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v5, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_10

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1497
    :cond_10
    const/4 v3, 0x0

    .line 1498
    .local v3, "fixed":Z
    iget-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v2, v5

    .line 1499
    .local v2, "expect":I
    iget-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    array-length v1, v5

    .line 1500
    .local v1, "current":I
    if-eq v1, v2, :cond_38

    .line 1501
    iget-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    invoke-static {v5, v2}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/util/logging/Filter;

    iput-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    .line 1502
    if-eqz v1, :cond_36

    const/4 v3, 0x1

    .line 1506
    :goto_26
    invoke-super {p0}, Ljava/util/logging/Handler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v0

    .line 1507
    .local v0, "body":Ljava/util/logging/Filter;
    if-eqz v0, :cond_38

    .line 1508
    move v4, v1

    .local v4, "i":I
    :goto_2d
    if-ge v4, v2, :cond_38

    .line 1509
    iget-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    aput-object v0, v5, v4

    .line 1508
    add-int/lit8 v4, v4, 0x1

    goto :goto_2d

    .line 1502
    .end local v0    # "body":Ljava/util/logging/Filter;
    .end local v4    # "i":I
    :cond_36
    const/4 v3, 0x0

    goto :goto_26

    .line 1515
    :cond_38
    if-nez v2, :cond_4f

    .line 1516
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFilterArray()[Ljava/util/logging/Filter;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    .line 1517
    sget-boolean v5, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v5, :cond_4f

    iget-object v5, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    array-length v5, v5

    if-eqz v5, :cond_4f

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 1519
    :cond_4f
    return v3
.end method

.method private fixUpAttachmentNames()Z
    .registers 8

    .prologue
    .line 1466
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 1467
    :cond_10
    const/4 v2, 0x0

    .line 1468
    .local v2, "fixed":Z
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v1, v4

    .line 1469
    .local v1, "expect":I
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    array-length v0, v4

    .line 1470
    .local v0, "current":I
    if-eq v0, v1, :cond_26

    .line 1471
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    invoke-static {v4, v1}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/util/logging/Formatter;

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1472
    if-eqz v0, :cond_3d

    const/4 v2, 0x1

    .line 1476
    :cond_26
    :goto_26
    if-nez v1, :cond_3f

    .line 1477
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object v4

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1478
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_5c

    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    array-length v4, v4

    if-eqz v4, :cond_5c

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 1472
    :cond_3d
    const/4 v2, 0x0

    goto :goto_26

    .line 1480
    :cond_3f
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_40
    if-ge v3, v1, :cond_5c

    .line 1481
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    aget-object v4, v4, v3

    if-nez v4, :cond_59

    .line 1482
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    new-instance v5, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    aget-object v6, v6, v3

    .line 1483
    invoke-direct {p0, v6}, Lcom/sun/mail/util/logging/MailHandler;->toString(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    aput-object v5, v4, v3

    .line 1480
    :cond_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_40

    .line 1487
    .end local v3    # "i":I
    :cond_5c
    return v2
.end method

.method private fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 14
    .param p1, "msg"    # Lkorex/mail/internet/MimeMessage;
    .param p2, "verify"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v9, 0x4

    .line 2781
    :try_start_1
    monitor-enter p0
    :try_end_2
    .catch Lkorex/mail/MessagingException; {:try_start_1 .. :try_end_2} :catch_70
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_2} :catch_80

    .line 2782
    :try_start_2
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->createBodyPart()Lkorex/mail/internet/MimeBodyPart;

    move-result-object v2

    .line 2783
    .local v2, "body":Lkorex/mail/internet/MimeBodyPart;
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    iget-object v7, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;

    iget-object v8, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;

    invoke-direct {p0, v6, v7, v8}, Lcom/sun/mail/util/logging/MailHandler;->descriptionFrom(Ljava/util/Comparator;Ljava/util/logging/Level;Ljava/util/logging/Filter;)Ljava/lang/String;

    move-result-object v3

    .line 2784
    .local v3, "msgDesc":Ljava/lang/String;
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    invoke-direct {p0, v6}, Lcom/sun/mail/util/logging/MailHandler;->getClassId(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v5

    .line 2785
    .local v5, "subjectType":Ljava/lang/String;
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_2 .. :try_end_17} :catchall_6d

    .line 2787
    :try_start_17
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Formatted using "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez p3, :cond_77

    const-class v6, Ljava/lang/Throwable;

    .line 2788
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 2789
    :goto_2a
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", filtered with "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", and named by "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2e

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2787
    invoke-virtual {v2, v6}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Ljava/lang/String;)V

    .line 2792
    invoke-direct {p0, p3}, Lcom/sun/mail/util/logging/MailHandler;->toMsgString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "text/plain"

    invoke-direct {p0, v2, v6, v7}, Lcom/sun/mail/util/logging/MailHandler;->setContent(Lkorex/mail/internet/MimeBodyPart;Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 2793
    new-instance v4, Lkorex/mail/internet/MimeMultipart;

    invoke-direct {v4}, Lkorex/mail/internet/MimeMultipart;-><init>()V

    .line 2794
    .local v4, "multipart":Lkorex/mail/internet/MimeMultipart;
    invoke-virtual {v4, v2}, Lkorex/mail/internet/MimeMultipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 2795
    invoke-virtual {p1, v4}, Lkorex/mail/internet/MimeMessage;->setContent(Lkorex/mail/Multipart;)V

    .line 2796
    invoke-virtual {p1, v3}, Lkorex/mail/internet/MimeMessage;->setDescription(Ljava/lang/String;)V

    .line 2797
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setAcceptLang(Lkorex/mail/Part;)V

    .line 2798
    invoke-virtual {p1}, Lkorex/mail/internet/MimeMessage;->saveChanges()V
    :try_end_6c
    .catch Lkorex/mail/MessagingException; {:try_start_17 .. :try_end_6c} :catch_70
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_6c} :catch_80

    .line 2804
    .end local v2    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v3    # "msgDesc":Ljava/lang/String;
    .end local v4    # "multipart":Lkorex/mail/internet/MimeMultipart;
    .end local v5    # "subjectType":Ljava/lang/String;
    :goto_6c
    return-void

    .line 2785
    :catchall_6d
    move-exception v6

    :try_start_6e
    monitor-exit p0
    :try_end_6f
    .catchall {:try_start_6e .. :try_end_6f} :catchall_6d

    :try_start_6f
    throw v6
    :try_end_70
    .catch Lkorex/mail/MessagingException; {:try_start_6f .. :try_end_70} :catch_70
    .catch Ljava/lang/RuntimeException; {:try_start_6f .. :try_end_70} :catch_80

    .line 2799
    :catch_70
    move-exception v0

    .line 2800
    .local v0, "ME":Lkorex/mail/MessagingException;
    const-string v6, "Unable to create body."

    invoke-virtual {p0, v6, v0, v9}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_6c

    .line 2789
    .end local v0    # "ME":Lkorex/mail/MessagingException;
    .restart local v2    # "body":Lkorex/mail/internet/MimeBodyPart;
    .restart local v3    # "msgDesc":Ljava/lang/String;
    .restart local v5    # "subjectType":Ljava/lang/String;
    :cond_77
    :try_start_77
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;
    :try_end_7e
    .catch Lkorex/mail/MessagingException; {:try_start_77 .. :try_end_7e} :catch_70
    .catch Ljava/lang/RuntimeException; {:try_start_77 .. :try_end_7e} :catch_80

    move-result-object v6

    goto :goto_2a

    .line 2801
    .end local v2    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v3    # "msgDesc":Ljava/lang/String;
    .end local v5    # "subjectType":Ljava/lang/String;
    :catch_80
    move-exception v1

    .line 2802
    .local v1, "RE":Ljava/lang/RuntimeException;
    const-string v6, "Unable to create body."

    invoke-virtual {p0, v6, v1, v9}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_6c
.end method

.method private fixUpSession()Lkorex/mail/Session;
    .registers 4

    .prologue
    .line 2812
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2814
    :cond_10
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->mailProps:Ljava/util/Properties;

    const-string v2, "verify"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2c

    .line 2815
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->initSession()Lkorex/mail/Session;

    move-result-object v0

    .line 2816
    .local v0, "settings":Lkorex/mail/Session;
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_30

    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    if-eq v0, v1, :cond_30

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2818
    .end local v0    # "settings":Lkorex/mail/Session;
    :cond_2c
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    .line 2819
    const/4 v0, 0x0

    .line 2821
    .restart local v0    # "settings":Lkorex/mail/Session;
    :cond_30
    return-object v0
.end method

.method private format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 6
    .param p1, "f"    # Ljava/util/logging/Formatter;
    .param p2, "r"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 3208
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/util/logging/Formatter;->format(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 3211
    :goto_4
    return-object v1

    .line 3209
    :catch_5
    move-exception v0

    .line 3210
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3211
    const-string v1, ""

    goto :goto_4
.end method

.method private getAndSetContextClassLoader()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 3511
    :try_start_0
    sget-object v1, Lcom/sun/mail/util/logging/MailHandler;->GET_AND_SET_CCL:Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 3513
    :goto_6
    return-object v1

    .line 3512
    :catch_7
    move-exception v0

    .line 3513
    .local v0, "ignore":Ljava/lang/SecurityException;
    sget-object v1, Lcom/sun/mail/util/logging/MailHandler;->GET_AND_SET_CCL:Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

    goto :goto_6
.end method

.method private getClassId(Ljava/util/logging/Formatter;)Ljava/lang/String;
    .registers 3
    .param p1, "f"    # Ljava/util/logging/Formatter;

    .prologue
    .line 2942
    instance-of v0, p1, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    if-eqz v0, :cond_b

    .line 2943
    const-class v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 2945
    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method private getContentType(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1345
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1346
    :cond_10
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->contentTypes:Lkorex/activation/FileTypeMap;

    invoke-virtual {v1, p1}, Lkorex/activation/FileTypeMap;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1347
    .local v0, "type":Ljava/lang/String;
    const-string v1, "application/octet-stream"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 1348
    const/4 v0, 0x0

    .line 1350
    .end local v0    # "type":Ljava/lang/String;
    :cond_1f
    return-object v0
.end method

.method private getEncodingName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1359
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 1360
    .local v0, "encoding":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 1361
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v0

    .line 1363
    :cond_a
    return-object v0
.end method

.method private grow()V
    .registers 4

    .prologue
    .line 1568
    sget-boolean v2, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1569
    :cond_10
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v0, v2

    .line 1570
    .local v0, "len":I
    shr-int/lit8 v2, v0, 0x1

    add-int/2addr v2, v0

    add-int/lit8 v1, v2, 0x1

    .line 1571
    .local v1, "newCapacity":I
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-gt v1, v2, :cond_1e

    if-ge v1, v0, :cond_20

    .line 1572
    :cond_1e
    iget v1, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    .line 1574
    :cond_20
    sget-boolean v2, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_2e

    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-ne v0, v2, :cond_2e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(I)V

    throw v2

    .line 1575
    :cond_2e
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    invoke-static {v2, v1}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/util/logging/LogRecord;

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    .line 1576
    return-void
.end method

.method private static hasValue(Ljava/lang/String;)Z
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1783
    invoke-static {p0}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "null"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private head(Ljava/util/logging/Formatter;)Ljava/lang/String;
    .registers 5
    .param p1, "f"    # Ljava/util/logging/Formatter;

    .prologue
    .line 3193
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/logging/Formatter;->getHead(Ljava/util/logging/Handler;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 3196
    :goto_4
    return-object v1

    .line 3194
    :catch_5
    move-exception v0

    .line 3195
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3196
    const-string v1, ""

    goto :goto_4
.end method

.method private declared-synchronized init(Ljava/util/Properties;)V
    .registers 5
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 1586
    monitor-enter p0

    :try_start_1
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    .line 1587
    .local v0, "manager":Ljava/util/logging/LogManager;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1588
    .local v1, "p":Ljava/lang/String;
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->mailProps:Ljava/util/Properties;

    .line 1589
    invoke-static {}, Lkorex/activation/FileTypeMap;->getDefaultFileTypeMap()Lkorex/activation/FileTypeMap;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->contentTypes:Lkorex/activation/FileTypeMap;

    .line 1592
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initErrorManager(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1594
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initLevel(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1595
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initFilter(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1596
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initCapacity(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1597
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initAuthenticator(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1599
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initEncoding(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1600
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initFormatter(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1601
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initComparator(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1602
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initPushLevel(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1603
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initPushFilter(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1605
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initSubject(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1607
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initAttachmentFormaters(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1608
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initAttachmentFilters(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1609
    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->initAttachmentNames(Ljava/util/logging/LogManager;Ljava/lang/String;)V

    .line 1611
    if-nez p1, :cond_59

    const-string v2, ".verify"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_59

    .line 1612
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->initSession()Lkorex/mail/Session;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/sun/mail/util/logging/MailHandler;->verifySettings(Lkorex/mail/Session;)V

    .line 1614
    :cond_59
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->intern()V
    :try_end_5c
    .catchall {:try_start_1 .. :try_end_5c} :catchall_5e

    .line 1615
    monitor-exit p0

    return-void

    .line 1586
    .end local v0    # "manager":Ljava/util/logging/LogManager;
    .end local v1    # "p":Ljava/lang/String;
    :catchall_5e
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private initAttachmentFilters(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 12
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x4

    .line 1794
    sget-boolean v6, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v6, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_11

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 1795
    :cond_11
    sget-boolean v6, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v6, :cond_1f

    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    if-nez v6, :cond_1f

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 1796
    :cond_1f
    const-string v6, ".attachment.filters"

    invoke-virtual {p2, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1797
    .local v4, "list":Ljava/lang/String;
    invoke-static {v4}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_78

    .line 1798
    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1799
    .local v5, "names":[Ljava/lang/String;
    array-length v6, v5

    new-array v2, v6, [Ljava/util/logging/Filter;

    .line 1800
    .local v2, "a":[Ljava/util/logging/Filter;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_39
    array-length v6, v2

    if-ge v3, v6, :cond_64

    .line 1801
    aget-object v6, v5, v3

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    .line 1802
    const-string v6, "null"

    aget-object v7, v5, v3

    invoke-virtual {v6, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_56

    .line 1804
    :try_start_4e
    aget-object v6, v5, v3

    invoke-static {v6}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFilter(Ljava/lang/String;)Ljava/util/logging/Filter;

    move-result-object v6

    aput-object v6, v2, v3
    :try_end_56
    .catch Ljava/lang/SecurityException; {:try_start_4e .. :try_end_56} :catch_59
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_56} :catch_5b

    .line 1800
    :cond_56
    :goto_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 1805
    :catch_59
    move-exception v1

    .line 1806
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 1807
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_5b
    move-exception v0

    .line 1808
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v0, v8}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_56

    .line 1813
    .end local v0    # "E":Ljava/lang/Exception;
    :cond_64
    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    .line 1814
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentFilters()Z

    move-result v6

    if-eqz v6, :cond_77

    .line 1815
    const-string v6, "Attachment filters."

    const-string v7, "Length mismatch."

    .line 1816
    invoke-static {v7}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v7

    .line 1815
    invoke-virtual {p0, v6, v7, v8}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1822
    .end local v2    # "a":[Ljava/util/logging/Filter;
    .end local v3    # "i":I
    .end local v5    # "names":[Ljava/lang/String;
    :cond_77
    :goto_77
    return-void

    .line 1819
    :cond_78
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFilterArray()[Ljava/util/logging/Filter;

    move-result-object v6

    iput-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    .line 1820
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentFilters()Z

    goto :goto_77
.end method

.method private initAttachmentFormaters(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 14
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    .line 1832
    sget-boolean v8, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v8, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_11

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 1833
    :cond_11
    const-string v8, ".attachment.formatters"

    invoke-virtual {p2, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1834
    .local v6, "list":Ljava/lang/String;
    invoke-static {v6}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_9c

    .line 1836
    const-string v8, ","

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 1837
    .local v7, "names":[Ljava/lang/String;
    array-length v8, v7

    if-nez v8, :cond_6d

    .line 1838
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object v4

    .line 1843
    .local v4, "a":[Ljava/util/logging/Formatter;
    :goto_2e
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2f
    array-length v8, v4

    if-ge v5, v8, :cond_99

    .line 1844
    aget-object v8, v7, v5

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v5

    .line 1845
    const-string v8, "null"

    aget-object v9, v7, v5

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_83

    .line 1847
    :try_start_44
    aget-object v8, v7, v5

    invoke-static {v8}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v8

    aput-object v8, v4, v5

    .line 1848
    aget-object v8, v4, v5

    instance-of v8, v8, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    if-eqz v8, :cond_6a

    .line 1849
    new-instance v0, Ljava/lang/ClassNotFoundException;

    aget-object v8, v4, v5

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    .line 1850
    .local v0, "CNFE":Ljava/lang/Exception;
    const-string v8, "Attachment formatter."

    const/4 v9, 0x4

    invoke-virtual {p0, v8, v0, v9}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1851
    new-instance v8, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v8}, Ljava/util/logging/SimpleFormatter;-><init>()V

    aput-object v8, v4, v5
    :try_end_6a
    .catch Ljava/lang/SecurityException; {:try_start_44 .. :try_end_6a} :catch_71
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_6a} :catch_73

    .line 1843
    .end local v0    # "CNFE":Ljava/lang/Exception;
    :cond_6a
    :goto_6a
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 1840
    .end local v4    # "a":[Ljava/util/logging/Formatter;
    .end local v5    # "i":I
    :cond_6d
    array-length v8, v7

    new-array v4, v8, [Ljava/util/logging/Formatter;

    .restart local v4    # "a":[Ljava/util/logging/Formatter;
    goto :goto_2e

    .line 1853
    .restart local v5    # "i":I
    :catch_71
    move-exception v3

    .line 1854
    .local v3, "SE":Ljava/lang/SecurityException;
    throw v3

    .line 1855
    .end local v3    # "SE":Ljava/lang/SecurityException;
    :catch_73
    move-exception v1

    .line 1856
    .local v1, "E":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v1, v10}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1857
    new-instance v8, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v8}, Ljava/util/logging/SimpleFormatter;-><init>()V

    aput-object v8, v4, v5

    goto :goto_6a

    .line 1860
    .end local v1    # "E":Ljava/lang/Exception;
    :cond_83
    new-instance v2, Ljava/lang/NullPointerException;

    invoke-static {v5}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 1861
    .local v2, "NPE":Ljava/lang/Exception;
    const-string v8, "Attachment formatter."

    invoke-virtual {p0, v8, v2, v10}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1862
    new-instance v8, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v8}, Ljava/util/logging/SimpleFormatter;-><init>()V

    aput-object v8, v4, v5

    goto :goto_6a

    .line 1866
    .end local v2    # "NPE":Ljava/lang/Exception;
    :cond_99
    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    .line 1870
    .end local v4    # "a":[Ljava/util/logging/Formatter;
    .end local v5    # "i":I
    .end local v7    # "names":[Ljava/lang/String;
    :goto_9b
    return-void

    .line 1868
    :cond_9c
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object v8

    iput-object v8, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    goto :goto_9b
.end method

.method private initAttachmentNames(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 14
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    .line 1880
    sget-boolean v8, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v8, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_11

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 1881
    :cond_11
    sget-boolean v8, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v8, :cond_1f

    iget-object v8, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    if-nez v8, :cond_1f

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 1883
    :cond_1f
    const-string v8, ".attachment.names"

    invoke-virtual {p2, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1884
    .local v5, "list":Ljava/lang/String;
    invoke-static {v5}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_9d

    .line 1885
    const-string v8, ","

    invoke-virtual {v5, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 1886
    .local v7, "names":[Ljava/lang/String;
    array-length v8, v7

    new-array v3, v8, [Ljava/util/logging/Formatter;

    .line 1887
    .local v3, "a":[Ljava/util/logging/Formatter;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_39
    array-length v8, v3

    if-ge v4, v8, :cond_89

    .line 1888
    aget-object v8, v7, v4

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    .line 1889
    const-string v8, "null"

    aget-object v9, v7, v4

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_7a

    .line 1892
    :try_start_4e
    aget-object v8, v7, v4

    invoke-static {v8}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v8

    aput-object v8, v3, v4
    :try_end_56
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4e .. :try_end_56} :catch_59
    .catch Ljava/lang/ClassCastException; {:try_start_4e .. :try_end_56} :catch_66
    .catch Ljava/lang/SecurityException; {:try_start_4e .. :try_end_56} :catch_64
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_56} :catch_71

    .line 1887
    :goto_56
    add-int/lit8 v4, v4, 0x1

    goto :goto_39

    .line 1893
    :catch_59
    move-exception v6

    .line 1894
    .local v6, "literal":Ljava/lang/ClassNotFoundException;
    :try_start_5a
    new-instance v8, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    aget-object v9, v7, v4

    invoke-direct {v8, v9}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    aput-object v8, v3, v4
    :try_end_63
    .catch Ljava/lang/SecurityException; {:try_start_5a .. :try_end_63} :catch_64
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_63} :catch_71

    goto :goto_56

    .line 1898
    .end local v6    # "literal":Ljava/lang/ClassNotFoundException;
    :catch_64
    move-exception v2

    .line 1899
    .local v2, "SE":Ljava/lang/SecurityException;
    throw v2

    .line 1895
    .end local v2    # "SE":Ljava/lang/SecurityException;
    :catch_66
    move-exception v6

    .line 1896
    .local v6, "literal":Ljava/lang/ClassCastException;
    :try_start_67
    new-instance v8, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    aget-object v9, v7, v4

    invoke-direct {v8, v9}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    aput-object v8, v3, v4
    :try_end_70
    .catch Ljava/lang/SecurityException; {:try_start_67 .. :try_end_70} :catch_64
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_70} :catch_71

    goto :goto_56

    .line 1900
    .end local v6    # "literal":Ljava/lang/ClassCastException;
    :catch_71
    move-exception v0

    .line 1901
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v0, v10}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_56

    .line 1904
    .end local v0    # "E":Ljava/lang/Exception;
    :cond_7a
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-static {v4}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 1905
    .local v1, "NPE":Ljava/lang/Exception;
    const-string v8, "Attachment names."

    invoke-virtual {p0, v8, v1, v10}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_56

    .line 1909
    .end local v1    # "NPE":Ljava/lang/Exception;
    :cond_89
    iput-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1910
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentNames()Z

    move-result v8

    if-eqz v8, :cond_9c

    .line 1911
    const-string v8, "Attachment names."

    const-string v9, "Length mismatch."

    .line 1912
    invoke-static {v9}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v9

    .line 1911
    invoke-virtual {p0, v8, v9, v10}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1918
    .end local v3    # "a":[Ljava/util/logging/Formatter;
    .end local v4    # "i":I
    .end local v7    # "names":[Ljava/lang/String;
    :cond_9c
    :goto_9c
    return-void

    .line 1915
    :cond_9d
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object v8

    iput-object v8, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1916
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentNames()Z

    goto :goto_9c
.end method

.method private initAuthenticator(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 1928
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 1929
    :cond_10
    const-string v4, ".authenticator"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1930
    .local v3, "name":Ljava/lang/String;
    invoke-static {v3}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_26

    .line 1932
    :try_start_20
    invoke-static {v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->newAuthenticator(Ljava/lang/String;)Lkorex/mail/Authenticator;

    move-result-object v4

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;
    :try_end_26
    .catch Ljava/lang/SecurityException; {:try_start_20 .. :try_end_26} :catch_27
    .catch Ljava/lang/ClassNotFoundException; {:try_start_20 .. :try_end_26} :catch_29
    .catch Ljava/lang/ClassCastException; {:try_start_20 .. :try_end_26} :catch_32
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_26} :catch_3b

    .line 1943
    :cond_26
    :goto_26
    return-void

    .line 1933
    :catch_27
    move-exception v1

    .line 1934
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 1935
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_29
    move-exception v2

    .line 1936
    .local v2, "literalAuth":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;

    goto :goto_26

    .line 1937
    .end local v2    # "literalAuth":Ljava/lang/ClassNotFoundException;
    :catch_32
    move-exception v2

    .line 1938
    .local v2, "literalAuth":Ljava/lang/ClassCastException;
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;

    goto :goto_26

    .line 1939
    .end local v2    # "literalAuth":Ljava/lang/ClassCastException;
    :catch_3b
    move-exception v0

    .line 1940
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_26
.end method

.method private initCapacity(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x3e8

    .line 2002
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_12

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2003
    :cond_12
    const/16 v0, 0x3e8

    .line 2005
    .local v0, "DEFAULT_CAPACITY":I
    :try_start_14
    const-string v3, ".capacity"

    invoke-virtual {p2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2006
    .local v2, "value":Ljava/lang/String;
    if-eqz v2, :cond_33

    .line 2007
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {p0, v3}, Lcom/sun/mail/util/logging/MailHandler;->setCapacity0(I)V
    :try_end_27
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_27} :catch_39

    .line 2015
    .end local v2    # "value":Ljava/lang/String;
    :goto_27
    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-gtz v3, :cond_2d

    .line 2016
    iput v5, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    .line 2019
    :cond_2d
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/util/logging/LogRecord;

    iput-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    .line 2020
    return-void

    .line 2009
    .restart local v2    # "value":Ljava/lang/String;
    :cond_33
    const/16 v3, 0x3e8

    :try_start_35
    invoke-direct {p0, v3}, Lcom/sun/mail/util/logging/MailHandler;->setCapacity0(I)V
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_35 .. :try_end_38} :catch_39

    goto :goto_27

    .line 2011
    .end local v2    # "value":Ljava/lang/String;
    :catch_39
    move-exception v1

    .line 2012
    .local v1, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v1, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_27
.end method

.method private initComparator(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 2106
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 2107
    :cond_10
    const-string v4, ".comparator"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2108
    .local v2, "name":Ljava/lang/String;
    const-string v4, ".comparator.reverse"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2110
    .local v3, "reverse":Ljava/lang/String;
    :try_start_24
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_51

    .line 2111
    invoke-static {v2}, Lcom/sun/mail/util/logging/LogManagerProperties;->newComparator(Ljava/lang/String;)Ljava/util/Comparator;

    move-result-object v4

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    .line 2112
    invoke-static {v3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 2113
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_48

    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    if-nez v4, :cond_48

    new-instance v4, Ljava/lang/AssertionError;

    const-string v5, "null"

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4
    :try_end_46
    .catch Ljava/lang/SecurityException; {:try_start_24 .. :try_end_46} :catch_46
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_46} :catch_5f

    .line 2122
    :catch_46
    move-exception v1

    .line 2123
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2114
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :cond_48
    :try_start_48
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    invoke-static {v4}, Lcom/sun/mail/util/logging/LogManagerProperties;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v4

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    .line 2127
    :cond_50
    :goto_50
    return-void

    .line 2117
    :cond_51
    invoke-static {v3}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_50

    .line 2118
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "No comparator to reverse."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5f
    .catch Ljava/lang/SecurityException; {:try_start_48 .. :try_end_5f} :catch_46
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_5f} :catch_5f

    .line 2124
    :catch_5f
    move-exception v0

    .line 2125
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_50
.end method

.method private initEncoding(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 8
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x4

    .line 2030
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2032
    :cond_11
    :try_start_11
    const-string v3, ".encoding"

    invoke-virtual {p2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-super {p0, v3}, Ljava/util/logging/Handler;->setEncoding(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_1e} :catch_1f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_11 .. :try_end_1e} :catch_21
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_1e} :catch_2a

    .line 2040
    :goto_1e
    return-void

    .line 2033
    :catch_1f
    move-exception v1

    .line 2034
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2035
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_21
    move-exception v2

    .line 2036
    .local v2, "UEE":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v2, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_1e

    .line 2037
    .end local v2    # "UEE":Ljava/io/UnsupportedEncodingException;
    :catch_2a
    move-exception v0

    .line 2038
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_1e
.end method

.method private initErrorManager(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 2050
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 2051
    :cond_10
    const-string v4, ".errorManager"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2052
    .local v3, "name":Ljava/lang/String;
    if-eqz v3, :cond_23

    .line 2054
    :try_start_1c
    invoke-static {v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->newErrorManager(Ljava/lang/String;)Ljava/util/logging/ErrorManager;

    move-result-object v2

    .line 2055
    .local v2, "em":Ljava/util/logging/ErrorManager;
    invoke-super {p0, v2}, Ljava/util/logging/Handler;->setErrorManager(Ljava/util/logging/ErrorManager;)V
    :try_end_23
    .catch Ljava/lang/SecurityException; {:try_start_1c .. :try_end_23} :catch_24
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_23} :catch_26

    .line 2062
    .end local v2    # "em":Ljava/util/logging/ErrorManager;
    :cond_23
    :goto_23
    return-void

    .line 2056
    :catch_24
    move-exception v1

    .line 2057
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2058
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_26
    move-exception v0

    .line 2059
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_23
.end method

.method private initFilter(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 8
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 1981
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 1983
    :cond_10
    :try_start_10
    const-string v3, ".filter"

    invoke-virtual {p2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1984
    .local v2, "name":Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 1985
    invoke-static {v2}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFilter(Ljava/lang/String;)Ljava/util/logging/Filter;

    move-result-object v3

    invoke-super {p0, v3}, Ljava/util/logging/Handler;->setFilter(Ljava/util/logging/Filter;)V
    :try_end_27
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_27} :catch_28
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_27} :catch_2a

    .line 1992
    .end local v2    # "name":Ljava/lang/String;
    :cond_27
    :goto_27
    return-void

    .line 1987
    :catch_28
    move-exception v1

    .line 1988
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 1989
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_2a
    move-exception v0

    .line 1990
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_27
.end method

.method private initFormatter(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 10
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x4

    .line 2072
    sget-boolean v5, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v5, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_11

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 2073
    :cond_11
    const-string v5, ".formatter"

    invoke-virtual {p2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2074
    .local v4, "name":Ljava/lang/String;
    invoke-static {v4}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 2076
    :try_start_21
    invoke-static {v4}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v3

    .line 2077
    .local v3, "formatter":Ljava/util/logging/Formatter;
    sget-boolean v5, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v5, :cond_33

    if-nez v3, :cond_33

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5
    :try_end_31
    .catch Ljava/lang/SecurityException; {:try_start_21 .. :try_end_31} :catch_31
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_31} :catch_44

    .line 2083
    .end local v3    # "formatter":Ljava/util/logging/Formatter;
    :catch_31
    move-exception v1

    .line 2084
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2078
    .end local v1    # "SE":Ljava/lang/SecurityException;
    .restart local v3    # "formatter":Ljava/util/logging/Formatter;
    :cond_33
    :try_start_33
    instance-of v5, v3, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    if-nez v5, :cond_3b

    .line 2079
    invoke-super {p0, v3}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    .line 2096
    .end local v3    # "formatter":Ljava/util/logging/Formatter;
    :goto_3a
    return-void

    .line 2081
    .restart local v3    # "formatter":Ljava/util/logging/Formatter;
    :cond_3b
    new-instance v5, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v5}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-super {p0, v5}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V
    :try_end_43
    .catch Ljava/lang/SecurityException; {:try_start_33 .. :try_end_43} :catch_31
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_43} :catch_44

    goto :goto_3a

    .line 2085
    .end local v3    # "formatter":Ljava/util/logging/Formatter;
    :catch_44
    move-exception v0

    .line 2086
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v0, v6}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 2088
    :try_start_4c
    new-instance v5, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v5}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-super {p0, v5}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V
    :try_end_54
    .catch Ljava/lang/RuntimeException; {:try_start_4c .. :try_end_54} :catch_55

    goto :goto_3a

    .line 2089
    :catch_55
    move-exception v2

    .line 2090
    .local v2, "fail":Ljava/lang/RuntimeException;
    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v2, v6}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_3a

    .line 2094
    .end local v0    # "E":Ljava/lang/Exception;
    .end local v2    # "fail":Ljava/lang/RuntimeException;
    :cond_5e
    new-instance v5, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v5}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-super {p0, v5}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    goto :goto_3a
.end method

.method private initLevel(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x4

    .line 1953
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_11

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 1955
    :cond_11
    :try_start_11
    const-string v4, ".level"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1956
    .local v3, "val":Ljava/lang/String;
    if-eqz v3, :cond_25

    .line 1957
    invoke-static {v3}, Ljava/util/logging/Level;->parse(Ljava/lang/String;)Ljava/util/logging/Level;

    move-result-object v4

    invoke-super {p0, v4}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V

    .line 1971
    .end local v3    # "val":Ljava/lang/String;
    :goto_24
    return-void

    .line 1959
    .restart local v3    # "val":Ljava/lang/String;
    :cond_25
    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-super {p0, v4}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V
    :try_end_2a
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_2a} :catch_2b
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_2a} :catch_2d

    goto :goto_24

    .line 1961
    .end local v3    # "val":Ljava/lang/String;
    :catch_2b
    move-exception v1

    .line 1962
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 1963
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_2d
    move-exception v0

    .line 1964
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1966
    :try_start_35
    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-super {p0, v4}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V
    :try_end_3a
    .catch Ljava/lang/RuntimeException; {:try_start_35 .. :try_end_3a} :catch_3b

    goto :goto_24

    .line 1967
    :catch_3b
    move-exception v2

    .line 1968
    .local v2, "fail":Ljava/lang/RuntimeException;
    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v2, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_24
.end method

.method private initPushFilter(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 8
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 2160
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 2161
    :cond_10
    const-string v3, ".pushFilter"

    invoke-virtual {p2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2162
    .local v2, "name":Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 2164
    :try_start_20
    invoke-static {v2}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFilter(Ljava/lang/String;)Ljava/util/logging/Filter;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;
    :try_end_26
    .catch Ljava/lang/SecurityException; {:try_start_20 .. :try_end_26} :catch_27
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_26} :catch_29

    .line 2171
    :cond_26
    :goto_26
    return-void

    .line 2165
    :catch_27
    move-exception v1

    .line 2166
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2167
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_29
    move-exception v0

    .line 2168
    .local v0, "E":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_26
.end method

.method private initPushLevel(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 7
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 2137
    sget-boolean v2, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 2139
    :cond_10
    :try_start_10
    const-string v2, ".pushLevel"

    invoke-virtual {p2, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2140
    .local v1, "val":Ljava/lang/String;
    if-eqz v1, :cond_22

    .line 2141
    invoke-static {v1}, Ljava/util/logging/Level;->parse(Ljava/lang/String;)Ljava/util/logging/Level;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;
    :try_end_22
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_22} :catch_2b

    .line 2147
    .end local v1    # "val":Ljava/lang/String;
    :cond_22
    :goto_22
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;

    if-nez v2, :cond_2a

    .line 2148
    sget-object v2, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;

    .line 2150
    :cond_2a
    return-void

    .line 2143
    :catch_2b
    move-exception v0

    .line 2144
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {p0, v2, v0, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_22
.end method

.method private initSession()Lkorex/mail/Session;
    .registers 4

    .prologue
    .line 2829
    sget-boolean v2, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v2, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 2830
    :cond_10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 2831
    .local v0, "p":Ljava/lang/String;
    new-instance v1, Lcom/sun/mail/util/logging/LogManagerProperties;

    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->mailProps:Ljava/util/Properties;

    invoke-direct {v1, v2, v0}, Lcom/sun/mail/util/logging/LogManagerProperties;-><init>(Ljava/util/Properties;Ljava/lang/String;)V

    .line 2832
    .local v1, "proxy":Lcom/sun/mail/util/logging/LogManagerProperties;
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;

    invoke-static {v1, v2}, Lkorex/mail/Session;->getInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    .line 2833
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    return-object v2
.end method

.method private initSubject(Ljava/util/logging/LogManager;Ljava/lang/String;)V
    .registers 9
    .param p1, "manager"    # Ljava/util/logging/LogManager;
    .param p2, "p"    # Ljava/lang/String;

    .prologue
    .line 2181
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 2182
    :cond_10
    const-string v4, ".subject"

    invoke-virtual {p2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2183
    .local v3, "name":Ljava/lang/String;
    invoke-static {v3}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 2185
    :try_start_20
    invoke-static {v3}, Lcom/sun/mail/util/logging/LogManagerProperties;->newFormatter(Ljava/lang/String;)Ljava/util/logging/Formatter;

    move-result-object v4

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;
    :try_end_26
    .catch Ljava/lang/SecurityException; {:try_start_20 .. :try_end_26} :catch_34
    .catch Ljava/lang/ClassNotFoundException; {:try_start_20 .. :try_end_26} :catch_36
    .catch Ljava/lang/ClassCastException; {:try_start_20 .. :try_end_26} :catch_3f
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_26} :catch_48

    .line 2202
    :cond_26
    :goto_26
    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    if-nez v4, :cond_33

    .line 2203
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    const-string v5, ""

    invoke-direct {v4, v5}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 2205
    :cond_33
    return-void

    .line 2186
    :catch_34
    move-exception v1

    .line 2187
    .local v1, "SE":Ljava/lang/SecurityException;
    throw v1

    .line 2188
    .end local v1    # "SE":Ljava/lang/SecurityException;
    :catch_36
    move-exception v2

    .line 2189
    .local v2, "literalSubject":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    goto :goto_26

    .line 2190
    .end local v2    # "literalSubject":Ljava/lang/ClassNotFoundException;
    :catch_3f
    move-exception v2

    .line 2191
    .local v2, "literalSubject":Ljava/lang/ClassCastException;
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    goto :goto_26

    .line 2192
    .end local v2    # "literalSubject":Ljava/lang/ClassCastException;
    :catch_48
    move-exception v0

    .line 2193
    .local v0, "E":Ljava/lang/Exception;
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 2194
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_26

    .line 2197
    .end local v0    # "E":Ljava/lang/Exception;
    :cond_59
    if-eqz v3, :cond_26

    .line 2198
    new-instance v4, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v4, v3}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    goto :goto_26
.end method

.method private intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p2, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    const/4 v7, 0x0

    .line 1700
    if-nez p2, :cond_5

    .line 1701
    const/4 v4, 0x0

    .line 1765
    :goto_4
    return-object v4

    .line 1720
    :cond_5
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 1721
    move-object v1, p2

    .line 1730
    .local v1, "key":Ljava/lang/Object;
    :goto_1a
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_75

    .line 1731
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1732
    .local v0, "found":Ljava/lang/Object;
    if-nez v0, :cond_64

    .line 1734
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 1735
    .local v3, "right":Z
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1736
    .local v2, "left":Z
    if-eqz v3, :cond_5e

    if-eqz v2, :cond_5e

    .line 1738
    invoke-interface {p1, p2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1739
    if-eqz v0, :cond_4b

    .line 1740
    invoke-direct {p0, v1, v0}, Lcom/sun/mail/util/logging/MailHandler;->reportNonDiscriminating(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1741
    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1742
    if-eq v0, p2, :cond_4b

    .line 1743
    invoke-direct {p0, v1, v0}, Lcom/sun/mail/util/logging/MailHandler;->reportNonDiscriminating(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1744
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 1752
    :cond_4b
    :goto_4b
    move-object v4, p2

    .line 1753
    .local v4, "use":Ljava/lang/Object;
    goto :goto_4

    .line 1725
    .end local v0    # "found":Ljava/lang/Object;
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "left":Z
    .end local v3    # "right":Z
    .end local v4    # "use":Ljava/lang/Object;
    :cond_4d
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .restart local v1    # "key":Ljava/lang/Object;
    goto :goto_1a

    .line 1748
    .restart local v0    # "found":Ljava/lang/Object;
    .restart local v2    # "left":Z
    .restart local v3    # "right":Z
    :cond_5e
    if-eq v3, v2, :cond_4b

    .line 1749
    invoke-direct {p0, p2, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportNonSymmetric(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4b

    .line 1755
    .end local v2    # "left":Z
    .end local v3    # "right":Z
    :cond_64
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_70

    .line 1756
    move-object v4, v0

    .restart local v4    # "use":Ljava/lang/Object;
    goto :goto_4

    .line 1758
    .end local v4    # "use":Ljava/lang/Object;
    :cond_70
    invoke-direct {p0, p2, v0}, Lcom/sun/mail/util/logging/MailHandler;->reportNonDiscriminating(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1759
    move-object v4, p2

    .restart local v4    # "use":Ljava/lang/Object;
    goto :goto_4

    .line 1763
    .end local v0    # "found":Ljava/lang/Object;
    .end local v4    # "use":Ljava/lang/Object;
    :cond_75
    move-object v4, p2

    .restart local v4    # "use":Ljava/lang/Object;
    goto :goto_4
.end method

.method private intern()V
    .registers 10

    .prologue
    const/4 v8, 0x4

    .line 1625
    sget-boolean v6, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v6, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_11

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 1629
    :cond_11
    :try_start_11
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_16} :catch_c1

    .line 1631
    .local v4, "seen":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :try_start_16
    invoke-super {p0}, Ljava/util/logging/Handler;->getErrorManager()Ljava/util/logging/ErrorManager;

    move-result-object v6

    invoke-direct {p0, v4, v6}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/SecurityException; {:try_start_16 .. :try_end_1d} :catch_b6
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_1d} :catch_c1

    .line 1637
    :goto_1d
    :try_start_1d
    invoke-super {p0}, Ljava/util/logging/Handler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v0

    .line 1638
    .local v0, "canidate":Ljava/util/logging/Filter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1639
    .local v2, "result":Ljava/lang/Object;
    if-eq v2, v0, :cond_32

    .line 1640
    const-class v6, Ljava/util/logging/Filter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Filter;

    invoke-super {p0, v6}, Ljava/util/logging/Handler;->setFilter(Ljava/util/logging/Filter;)V

    .line 1643
    :cond_32
    invoke-super {p0}, Ljava/util/logging/Handler;->getFormatter()Ljava/util/logging/Formatter;

    move-result-object v0

    .line 1644
    .local v0, "canidate":Ljava/util/logging/Formatter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1645
    if-eq v2, v0, :cond_47

    .line 1646
    const-class v6, Ljava/util/logging/Formatter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Formatter;

    invoke-super {p0, v6}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V
    :try_end_47
    .catch Ljava/lang/SecurityException; {:try_start_1d .. :try_end_47} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_47} :catch_c1

    .line 1652
    .end local v0    # "canidate":Ljava/util/logging/Formatter;
    .end local v2    # "result":Ljava/lang/Object;
    :cond_47
    :goto_47
    :try_start_47
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 1653
    .restart local v0    # "canidate":Ljava/util/logging/Formatter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1654
    .restart local v2    # "result":Ljava/lang/Object;
    if-eq v2, v0, :cond_59

    .line 1655
    const-class v6, Ljava/util/logging/Formatter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Formatter;

    iput-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 1658
    :cond_59
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;

    .line 1659
    .local v0, "canidate":Ljava/util/logging/Filter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1660
    if-eq v2, v0, :cond_6b

    .line 1661
    const-class v6, Ljava/util/logging/Filter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Filter;

    iput-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;

    .line 1664
    :cond_6b
    const/4 v1, 0x0

    .end local v0    # "canidate":Ljava/util/logging/Filter;
    .local v1, "i":I
    :goto_6c
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v6, v6

    if-ge v1, v6, :cond_c9

    .line 1665
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    aget-object v0, v6, v1

    .line 1666
    .local v0, "canidate":Ljava/util/logging/Formatter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1667
    if-eq v2, v0, :cond_87

    .line 1668
    iget-object v7, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    const-class v6, Ljava/util/logging/Formatter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Formatter;

    aput-object v6, v7, v1

    .line 1671
    :cond_87
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    aget-object v0, v6, v1

    .line 1672
    .local v0, "canidate":Ljava/util/logging/Filter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1673
    if-eq v2, v0, :cond_9d

    .line 1674
    iget-object v7, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    const-class v6, Ljava/util/logging/Filter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Filter;

    aput-object v6, v7, v1

    .line 1677
    :cond_9d
    iget-object v6, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    aget-object v0, v6, v1

    .line 1678
    .local v0, "canidate":Ljava/util/logging/Formatter;
    invoke-direct {p0, v4, v0}, Lcom/sun/mail/util/logging/MailHandler;->intern(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1679
    if-eq v2, v0, :cond_b3

    .line 1680
    iget-object v7, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    const-class v6, Ljava/util/logging/Formatter;

    invoke-virtual {v6, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/logging/Formatter;

    aput-object v6, v7, v1

    .line 1664
    :cond_b3
    add-int/lit8 v1, v1, 0x1

    goto :goto_6c

    .line 1632
    .end local v0    # "canidate":Ljava/util/logging/Formatter;
    .end local v1    # "i":I
    .end local v2    # "result":Ljava/lang/Object;
    :catch_b6
    move-exception v3

    .line 1633
    .local v3, "se":Ljava/lang/SecurityException;
    invoke-virtual {v3}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v3, v7}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_bf
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_bf} :catch_c1

    goto/16 :goto_1d

    .line 1683
    .end local v3    # "se":Ljava/lang/SecurityException;
    .end local v4    # "seen":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :catch_c1
    move-exception v5

    .line 1684
    .local v5, "skip":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v5, v8}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1686
    .end local v5    # "skip":Ljava/lang/Exception;
    :cond_c9
    return-void

    .line 1648
    .restart local v4    # "seen":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    :catch_ca
    move-exception v3

    .line 1649
    .restart local v3    # "se":Ljava/lang/SecurityException;
    :try_start_cb
    invoke-virtual {v3}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v3, v7}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_d3} :catch_c1

    goto/16 :goto_47
.end method

.method private isAttachmentLoggable(Ljava/util/logging/LogRecord;)Z
    .registers 6
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 2215
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->readOnlyAttachmentFilters()[Ljava/util/logging/Filter;

    move-result-object v1

    .line 2216
    .local v1, "filters":[Ljava/util/logging/Filter;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    array-length v3, v1

    if-ge v2, v3, :cond_17

    .line 2217
    aget-object v0, v1, v2

    .line 2218
    .local v0, "f":Ljava/util/logging/Filter;
    if-eqz v0, :cond_12

    invoke-interface {v0, p1}, Ljava/util/logging/Filter;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 2219
    :cond_12
    const/4 v3, 0x1

    .line 2222
    .end local v0    # "f":Ljava/util/logging/Filter;
    :goto_13
    return v3

    .line 2216
    .restart local v0    # "f":Ljava/util/logging/Filter;
    :cond_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 2222
    .end local v0    # "f":Ljava/util/logging/Filter;
    :cond_17
    const/4 v3, 0x0

    goto :goto_13
.end method

.method private static isEmpty(Ljava/lang/String;)Z
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 1774
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private isPushable(Ljava/util/logging/LogRecord;)Z
    .registers 6
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    const/4 v2, 0x0

    .line 2232
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 2233
    :cond_11
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getPushLevel()Ljava/util/logging/Level;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    .line 2234
    .local v1, "value":I
    sget v3, Lcom/sun/mail/util/logging/MailHandler;->offValue:I

    if-eq v1, v3, :cond_27

    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/logging/Level;->intValue()I

    move-result v3

    if-ge v3, v1, :cond_28

    .line 2239
    :cond_27
    :goto_27
    return v2

    .line 2238
    :cond_28
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getPushFilter()Ljava/util/logging/Filter;

    move-result-object v0

    .line 2239
    .local v0, "filter":Ljava/util/logging/Filter;
    if-eqz v0, :cond_34

    invoke-interface {v0, p1}, Ljava/util/logging/Filter;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v3

    if-eqz v3, :cond_27

    :cond_34
    const/4 v2, 0x1

    goto :goto_27
.end method

.method private localeFor(Ljava/util/logging/LogRecord;)Ljava/util/Locale;
    .registers 5
    .param p1, "r"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 3042
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v1

    .line 3043
    .local v1, "rb":Ljava/util/ResourceBundle;
    if-eqz v1, :cond_1b

    .line 3044
    invoke-virtual {v1}, Ljava/util/ResourceBundle;->getLocale()Ljava/util/Locale;

    move-result-object v0

    .line 3045
    .local v0, "l":Ljava/util/Locale;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 3051
    :cond_16
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 3056
    :cond_1a
    :goto_1a
    return-object v0

    .line 3054
    .end local v0    # "l":Ljava/util/Locale;
    :cond_1b
    const/4 v0, 0x0

    .restart local v0    # "l":Ljava/util/Locale;
    goto :goto_1a
.end method

.method private publish0(Ljava/util/logging/LogRecord;)V
    .registers 7
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    const/4 v4, 0x1

    .line 604
    monitor-enter p0

    .line 605
    :try_start_2
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v3, v3

    if-ne v2, v3, :cond_12

    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-ge v2, v3, :cond_12

    .line 606
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->grow()V

    .line 609
    :cond_12
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v3, v3

    if-ge v2, v3, :cond_3f

    .line 610
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    aput-object p1, v2, v3

    .line 611
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    .line 612
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->isPushable(Ljava/util/logging/LogRecord;)Z

    move-result v1

    .line 613
    .local v1, "priority":Z
    if-nez v1, :cond_31

    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-lt v2, v3, :cond_3d

    .line 614
    :cond_31
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/sun/mail/util/logging/MailHandler;->writeLogRecords(I)Lkorex/mail/Message;

    move-result-object v0

    .line 622
    .local v0, "msg":Lkorex/mail/Message;
    :goto_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_2 .. :try_end_37} :catchall_42

    .line 624
    if-eqz v0, :cond_3c

    .line 625
    invoke-direct {p0, v0, v1, v4}, Lcom/sun/mail/util/logging/MailHandler;->send(Lkorex/mail/Message;ZI)V

    .line 627
    :cond_3c
    return-void

    .line 616
    .end local v0    # "msg":Lkorex/mail/Message;
    :cond_3d
    const/4 v0, 0x0

    .restart local v0    # "msg":Lkorex/mail/Message;
    goto :goto_36

    .line 619
    .end local v0    # "msg":Lkorex/mail/Message;
    .end local v1    # "priority":Z
    :cond_3f
    const/4 v1, 0x0

    .line 620
    .restart local v1    # "priority":Z
    const/4 v0, 0x0

    .restart local v0    # "msg":Lkorex/mail/Message;
    goto :goto_36

    .line 622
    .end local v0    # "msg":Lkorex/mail/Message;
    .end local v1    # "priority":Z
    :catchall_42
    move-exception v2

    :try_start_43
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_43 .. :try_end_44} :catchall_42

    throw v2
.end method

.method private push(ZI)V
    .registers 5
    .param p1, "priority"    # Z
    .param p2, "code"    # I

    .prologue
    .line 2248
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->tryMutex()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 2250
    :try_start_6
    invoke-direct {p0, p2}, Lcom/sun/mail/util/logging/MailHandler;->writeLogRecords(I)Lkorex/mail/Message;

    move-result-object v0

    .line 2251
    .local v0, "msg":Lkorex/mail/Message;
    if-eqz v0, :cond_f

    .line 2252
    invoke-direct {p0, v0, p1, p2}, Lcom/sun/mail/util/logging/MailHandler;->send(Lkorex/mail/Message;ZI)V
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_13

    .line 2255
    :cond_f
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->releaseMutex()V

    .line 2260
    .end local v0    # "msg":Lkorex/mail/Message;
    :goto_12
    return-void

    .line 2255
    :catchall_13
    move-exception v1

    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->releaseMutex()V

    throw v1

    .line 2258
    :cond_18
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportUnPublishedError(Ljava/util/logging/LogRecord;)V

    goto :goto_12
.end method

.method private readOnlyAttachmentFilters()[Ljava/util/logging/Filter;
    .registers 2

    .prologue
    .line 1442
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    return-object v0
.end method

.method private releaseMutex()V
    .registers 2

    .prologue
    .line 682
    sget-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 683
    return-void
.end method

.method private reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "ex"    # Ljava/lang/Exception;
    .param p3, "code"    # I

    .prologue
    .line 1330
    :try_start_0
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->toRawString(Lkorex/mail/Message;)Ljava/lang/String;

    move-result-object v2

    invoke-super {p0, v2, p2, p3}, Ljava/util/logging/Handler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_7
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_7} :catch_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_11

    .line 1336
    :goto_7
    return-void

    .line 1331
    :catch_8
    move-exception v1

    .line 1332
    .local v1, "rawMe":Lkorex/mail/MessagingException;
    invoke-direct {p0, v1}, Lcom/sun/mail/util/logging/MailHandler;->toMsgString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2, p3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_7

    .line 1333
    .end local v1    # "rawMe":Lkorex/mail/MessagingException;
    :catch_11
    move-exception v0

    .line 1334
    .local v0, "rawIo":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->toMsgString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2, p3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_7
.end method

.method private reportFilterError(Ljava/util/logging/LogRecord;)V
    .registers 8
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 3137
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 3138
    :cond_10
    new-instance v0, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v0}, Ljava/util/logging/SimpleFormatter;-><init>()V

    .line 3139
    .local v0, "f":Ljava/util/logging/SimpleFormatter;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Log record "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSequenceNumber()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was filtered from all message parts.  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3141
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v0, p1}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-direct {p0, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3142
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 3143
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->readOnlyAttachmentFilters()[Ljava/util/logging/Filter;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3144
    .local v2, "txt":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x5

    invoke-virtual {p0, v1, v3, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3146
    return-void
.end method

.method private reportNonDiscriminating(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "found"    # Ljava/lang/Object;

    .prologue
    .line 3171
    const-string v0, "Non discriminating equals implementation."

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 3172
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " should not be equal to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 3173
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x4

    .line 3171
    invoke-virtual {p0, v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3175
    return-void
.end method

.method private reportNonSymmetric(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "found"    # Ljava/lang/Object;

    .prologue
    .line 3156
    const-string v0, "Non symmetric equals implementation."

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 3157
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not equal to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 3158
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x4

    .line 3156
    invoke-virtual {p0, v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3160
    return-void
.end method

.method private reportNullError(I)V
    .registers 4
    .param p1, "code"    # I

    .prologue
    .line 3183
    const-string v0, "null"

    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    invoke-virtual {p0, v0, v1, p1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3184
    return-void
.end method

.method private reportUnPublishedError(Ljava/util/logging/LogRecord;)V
    .registers 8
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 638
    sget-object v3, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_PUBLISH:Ljava/util/logging/Level;

    sget-object v4, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Level;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7a

    .line 639
    sget-object v3, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    sget-object v4, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_REPORT:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 642
    if-eqz p1, :cond_7b

    .line 643
    :try_start_17
    new-instance v1, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v1}, Ljava/util/logging/SimpleFormatter;-><init>()V

    .line 644
    .local v1, "f":Ljava/util/logging/SimpleFormatter;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Log record "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSequenceNumber()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was not published. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 646
    invoke-direct {p0, v1}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0, v1, p1}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-direct {p0, v1, v4}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 650
    .end local v1    # "f":Ljava/util/logging/SimpleFormatter;
    .local v2, "msg":Ljava/lang/String;
    :goto_53
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Recursive publish detected by thread "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 652
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 653
    .local v0, "e":Ljava/lang/Exception;
    const/4 v3, 0x1

    invoke-virtual {p0, v2, v0, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_73
    .catchall {:try_start_17 .. :try_end_73} :catchall_7d

    .line 655
    sget-object v3, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    sget-object v4, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_PUBLISH:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 658
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_7a
    return-void

    .line 648
    :cond_7b
    const/4 v2, 0x0

    .restart local v2    # "msg":Ljava/lang/String;
    goto :goto_53

    .line 655
    .end local v2    # "msg":Ljava/lang/String;
    :catchall_7d
    move-exception v3

    sget-object v4, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    sget-object v5, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_PUBLISH:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v3
.end method

.method private reportUnexpectedSend(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 6
    .param p1, "msg"    # Lkorex/mail/internet/MimeMessage;
    .param p2, "verify"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 2761
    new-instance v0, Lkorex/mail/MessagingException;

    const-string v1, "An empty message was sent."

    invoke-direct {v0, v1, p3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2763
    .local v0, "write":Lkorex/mail/MessagingException;
    invoke-direct {p0, p1, p2, v0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2764
    const/4 v1, 0x4

    invoke-direct {p0, p1, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    .line 2765
    return-void
.end method

.method private reset()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1555
    sget-boolean v0, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1556
    :cond_12
    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v1, v1

    if-ge v0, v1, :cond_23

    .line 1557
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    iget v1, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 1561
    :goto_20
    iput v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    .line 1562
    return-void

    .line 1559
    :cond_23
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_20
.end method

.method private send(Lkorex/mail/Message;ZI)V
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "priority"    # Z
    .param p3, "code"    # I

    .prologue
    .line 2274
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/util/logging/MailHandler;->envelopeFor(Lkorex/mail/Message;Z)V

    .line 2275
    invoke-static {p1}, Lkorex/mail/Transport;->send(Lkorex/mail/Message;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    .line 2279
    :goto_6
    return-void

    .line 2276
    :catch_7
    move-exception v0

    .line 2277
    .local v0, "E":Ljava/lang/Exception;
    invoke-direct {p0, p1, v0, p3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto :goto_6
.end method

.method private setAcceptLang(Lkorex/mail/Part;)V
    .registers 6
    .param p1, "p"    # Lkorex/mail/Part;

    .prologue
    .line 3119
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/mail/util/logging/LogManagerProperties;->toLanguageTag(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 3120
    .local v1, "lang":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_13

    .line 3121
    const-string v2, "Accept-Language"

    invoke-interface {p1, v2, v1}, Lkorex/mail/Part;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_13} :catch_14

    .line 3126
    .end local v1    # "lang":Ljava/lang/String;
    :cond_13
    :goto_13
    return-void

    .line 3123
    :catch_14
    move-exception v0

    .line 3124
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {p0, v2, v0, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_13
.end method

.method private setAuthenticator0(Lkorex/mail/Authenticator;)V
    .registers 4
    .param p1, "auth"    # Lkorex/mail/Authenticator;

    .prologue
    .line 914
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 917
    monitor-enter p0

    .line 918
    :try_start_4
    iget-boolean v1, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v1, :cond_11

    .line 919
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 923
    :catchall_e
    move-exception v1

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_4 .. :try_end_10} :catchall_e

    throw v1

    .line 921
    :cond_11
    :try_start_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;

    .line 922
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpSession()Lkorex/mail/Session;

    move-result-object v0

    .line 923
    .local v0, "settings":Lkorex/mail/Session;
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_11 .. :try_end_18} :catchall_e

    .line 924
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->verifySettings(Lkorex/mail/Session;)V

    .line 925
    return-void
.end method

.method private setAutoSubmitted(Lkorex/mail/Message;)V
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3297
    :try_start_0
    const-string v1, "auto-submitted"

    const-string v2, "auto-generated"

    invoke-virtual {p1, v1, v2}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_7} :catch_8

    .line 3301
    :goto_7
    return-void

    .line 3298
    :catch_8
    move-exception v0

    .line 3299
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_7
.end method

.method private declared-synchronized setCapacity0(I)V
    .registers 4
    .param p1, "newCapacity"    # I

    .prologue
    .line 1419
    monitor-enter p0

    if-gtz p1, :cond_e

    .line 1420
    :try_start_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Capacity must be greater than zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 1419
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1423
    :cond_e
    :try_start_e
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_18

    .line 1424
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1427
    :cond_18
    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-gez v0, :cond_21

    .line 1428
    neg-int v0, p1

    iput v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I
    :try_end_1f
    .catchall {:try_start_e .. :try_end_1f} :catchall_b

    .line 1432
    :goto_1f
    monitor-exit p0

    return-void

    .line 1430
    :cond_21
    :try_start_21
    iput p1, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I
    :try_end_23
    .catchall {:try_start_21 .. :try_end_23} :catchall_b

    goto :goto_1f
.end method

.method private setContent(Lkorex/mail/internet/MimeBodyPart;Ljava/lang/CharSequence;Ljava/lang/String;)V
    .registers 9
    .param p1, "part"    # Lkorex/mail/internet/MimeBodyPart;
    .param p2, "buf"    # Ljava/lang/CharSequence;
    .param p3, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 1374
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncodingName()Ljava/lang/String;

    move-result-object v1

    .line 1375
    .local v1, "encoding":Ljava/lang/String;
    if-eqz p3, :cond_35

    const-string v3, "text/plain"

    invoke-virtual {v3, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_35

    .line 1376
    invoke-direct {p0, p3, v1}, Lcom/sun/mail/util/logging/MailHandler;->contentWithEncoding(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 1378
    :try_start_12
    new-instance v2, Lkorex/mail/util/ByteArrayDataSource;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p3}, Lkorex/mail/util/ByteArrayDataSource;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1379
    .local v2, "source":Lkorex/activation/DataSource;
    new-instance v3, Lkorex/activation/DataHandler;

    invoke-direct {v3, v2}, Lkorex/activation/DataHandler;-><init>(Lkorex/activation/DataSource;)V

    invoke-virtual {p1, v3}, Lkorex/mail/internet/MimeBodyPart;->setDataHandler(Lkorex/activation/DataHandler;)V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_23} :catch_24

    .line 1387
    .end local v2    # "source":Lkorex/activation/DataSource;
    :goto_23
    return-void

    .line 1380
    :catch_24
    move-exception v0

    .line 1381
    .local v0, "IOE":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1382
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v1}, Lkorex/mail/internet/MimeBodyPart;->setText(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23

    .line 1385
    .end local v0    # "IOE":Ljava/io/IOException;
    :cond_35
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lkorex/mail/internet/MimeUtility;->mimeCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lkorex/mail/internet/MimeBodyPart;->setText(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23
.end method

.method private setContextClassLoader(Ljava/lang/Object;)V
    .registers 3
    .param p1, "ccl"    # Ljava/lang/Object;

    .prologue
    .line 3525
    if-eqz p1, :cond_6

    instance-of v0, p1, Ljava/lang/ClassLoader;

    if-eqz v0, :cond_e

    .line 3526
    :cond_6
    new-instance v0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;

    invoke-direct {v0, p1}, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    .line 3528
    :cond_e
    return-void
.end method

.method private setDefaultFrom(Lkorex/mail/Message;)V
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3338
    :try_start_0
    invoke-virtual {p1}, Lkorex/mail/Message;->setFrom()V
    :try_end_3
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_3} :catch_4

    .line 3342
    :goto_3
    return-void

    .line 3339
    :catch_4
    move-exception v0

    .line 3340
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_3
.end method

.method private setDefaultRecipient(Lkorex/mail/Message;Lkorex/mail/Message$RecipientType;)V
    .registers 11
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "type"    # Lkorex/mail/Message$RecipientType;

    .prologue
    const/4 v7, 0x5

    .line 3354
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v5

    invoke-static {v5}, Lkorex/mail/internet/InternetAddress;->getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;

    move-result-object v2

    .line 3355
    .local v2, "a":Lkorex/mail/Address;
    if-eqz v2, :cond_f

    .line 3356
    invoke-virtual {p1, p2, v2}, Lkorex/mail/Message;->setRecipient(Lkorex/mail/Message$RecipientType;Lkorex/mail/Address;)V

    .line 3374
    .end local v2    # "a":Lkorex/mail/Address;
    :goto_e
    return-void

    .line 3358
    .restart local v2    # "a":Lkorex/mail/Address;
    :cond_f
    new-instance v4, Lkorex/mail/internet/MimeMessage;

    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 3359
    .local v4, "m":Lkorex/mail/internet/MimeMessage;
    invoke-virtual {v4}, Lkorex/mail/internet/MimeMessage;->setFrom()V

    .line 3360
    invoke-virtual {v4}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v3

    .line 3361
    .local v3, "from":[Lkorex/mail/Address;
    array-length v5, v3

    if-lez v5, :cond_2d

    .line 3362
    invoke-virtual {p1, p2, v3}, Lkorex/mail/Message;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    :try_end_25
    .catch Lkorex/mail/MessagingException; {:try_start_1 .. :try_end_25} :catch_26
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_25} :catch_35

    goto :goto_e

    .line 3367
    .end local v2    # "a":Lkorex/mail/Address;
    .end local v3    # "from":[Lkorex/mail/Address;
    .end local v4    # "m":Lkorex/mail/internet/MimeMessage;
    :catch_26
    move-exception v0

    .line 3368
    .local v0, "ME":Lkorex/mail/MessagingException;
    const-string v5, "Unable to compute a default recipient."

    invoke-virtual {p0, v5, v0, v7}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_e

    .line 3364
    .end local v0    # "ME":Lkorex/mail/MessagingException;
    .restart local v2    # "a":Lkorex/mail/Address;
    .restart local v3    # "from":[Lkorex/mail/Address;
    .restart local v4    # "m":Lkorex/mail/internet/MimeMessage;
    :cond_2d
    :try_start_2d
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "No local address."

    invoke-direct {v5, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_35
    .catch Lkorex/mail/MessagingException; {:try_start_2d .. :try_end_35} :catch_26
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_35} :catch_35

    .line 3370
    .end local v2    # "a":Lkorex/mail/Address;
    .end local v3    # "from":[Lkorex/mail/Address;
    .end local v4    # "m":Lkorex/mail/internet/MimeMessage;
    :catch_35
    move-exception v1

    .line 3371
    .local v1, "RE":Ljava/lang/RuntimeException;
    const-string v5, "Unable to compute a default recipient."

    invoke-virtual {p0, v5, v1, v7}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_e
.end method

.method private setFrom(Lkorex/mail/Message;)V
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3308
    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v3

    const-string v4, "mail.from"

    invoke-virtual {v3, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3309
    .local v2, "from":Ljava/lang/String;
    if-eqz v2, :cond_30

    .line 3311
    const/4 v3, 0x0

    :try_start_d
    invoke-static {v2, v3}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    .line 3312
    .local v1, "address":[Lkorex/mail/Address;
    array-length v3, v1

    if-lez v3, :cond_1e

    .line 3313
    array-length v3, v1

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1f

    .line 3314
    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-virtual {p1, v3}, Lkorex/mail/Message;->setFrom(Lkorex/mail/Address;)V

    .line 3330
    .end local v1    # "address":[Lkorex/mail/Address;
    :cond_1e
    :goto_1e
    return-void

    .line 3316
    .restart local v1    # "address":[Lkorex/mail/Address;
    :cond_1f
    invoke-virtual {p1, v1}, Lkorex/mail/Message;->addFrom([Lkorex/mail/Address;)V
    :try_end_22
    .catch Lkorex/mail/MessagingException; {:try_start_d .. :try_end_22} :catch_23

    goto :goto_1e

    .line 3323
    .end local v1    # "address":[Lkorex/mail/Address;
    :catch_23
    move-exception v0

    .line 3324
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3325
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setDefaultFrom(Lkorex/mail/Message;)V

    goto :goto_1e

    .line 3328
    .end local v0    # "ME":Lkorex/mail/MessagingException;
    :cond_30
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setDefaultFrom(Lkorex/mail/Message;)V

    goto :goto_1e
.end method

.method private setIncompleteCopy(Lkorex/mail/Message;)V
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3283
    :try_start_0
    const-string v1, "Incomplete-Copy"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_7} :catch_8

    .line 3287
    :goto_7
    return-void

    .line 3284
    :catch_8
    move-exception v0

    .line 3285
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_7
.end method

.method private setMailProperties0(Ljava/util/Properties;)V
    .registers 4
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 948
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 949
    invoke-virtual {p1}, Ljava/util/Properties;->clone()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "props":Ljava/util/Properties;
    check-cast p1, Ljava/util/Properties;

    .line 951
    .restart local p1    # "props":Ljava/util/Properties;
    monitor-enter p0

    .line 952
    :try_start_a
    iget-boolean v1, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v1, :cond_17

    .line 953
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 957
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_a .. :try_end_16} :catchall_14

    throw v1

    .line 955
    :cond_17
    :try_start_17
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->mailProps:Ljava/util/Properties;

    .line 956
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpSession()Lkorex/mail/Session;

    move-result-object v0

    .line 957
    .local v0, "settings":Lkorex/mail/Session;
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_17 .. :try_end_1e} :catchall_14

    .line 958
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->verifySettings(Lkorex/mail/Session;)V

    .line 959
    return-void
.end method

.method private setMailer(Lkorex/mail/Message;)V
    .registers 11
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v8, 0x5

    .line 3236
    :try_start_1
    const-class v3, Lcom/sun/mail/util/logging/MailHandler;

    .line 3237
    .local v3, "mail":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 3239
    .local v2, "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne v2, v3, :cond_13

    .line 3240
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 3251
    .local v4, "value":Ljava/lang/String;
    :goto_d
    const-string v5, "X-Mailer"

    invoke-virtual {p1, v5, v4}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12
    .catch Lkorex/mail/MessagingException; {:try_start_1 .. :try_end_12} :catch_59

    .line 3255
    .end local v2    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "mail":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "value":Ljava/lang/String;
    :goto_12
    return-void

    .line 3243
    .restart local v2    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "mail":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    :try_start_13
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lkorex/mail/internet/MimeUtility;->encodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_13 .. :try_end_1a} :catch_43
    .catch Lkorex/mail/MessagingException; {:try_start_13 .. :try_end_1a} :catch_59

    move-result-object v4

    .line 3248
    .restart local v4    # "value":Ljava/lang/String;
    :goto_1b
    const/16 v5, 0xa

    :try_start_1d
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " using the "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " extension."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lkorex/mail/internet/MimeUtility;->fold(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_d

    .line 3244
    .end local v4    # "value":Ljava/lang/String;
    :catch_43
    move-exception v0

    .line 3245
    .local v0, "E":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x5

    invoke-virtual {p0, v5, v0, v6}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 3246
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "[^\\x00-\\x7F]"

    const-string v7, "\u001a"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_57
    .catch Lkorex/mail/MessagingException; {:try_start_1d .. :try_end_57} :catch_59

    move-result-object v4

    .restart local v4    # "value":Ljava/lang/String;
    goto :goto_1b

    .line 3252
    .end local v0    # "E":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "k":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "mail":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "value":Ljava/lang/String;
    :catch_59
    move-exception v1

    .line 3253
    .local v1, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v1}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v1, v8}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_12
.end method

.method private setPriority(Lkorex/mail/Message;)V
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3263
    :try_start_0
    const-string v1, "Importance"

    const-string v2, "High"

    invoke-virtual {p1, v1, v2}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3264
    const-string v1, "Priority"

    const-string v2, "urgent"

    invoke-virtual {p1, v1, v2}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 3265
    const-string v1, "X-Priority"

    const-string v2, "2"

    invoke-virtual {p1, v1, v2}, Lkorex/mail/Message;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_15
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_15} :catch_16

    .line 3269
    :goto_15
    return-void

    .line 3266
    :catch_16
    move-exception v0

    .line 3267
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_15
.end method

.method private setRecipient(Lkorex/mail/Message;Ljava/lang/String;Lkorex/mail/Message$RecipientType;)Z
    .registers 10
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "type"    # Lkorex/mail/Message$RecipientType;

    .prologue
    const/4 v2, 0x0

    .line 3440
    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v4

    invoke-virtual {v4, p2}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3441
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_c

    const/4 v2, 0x1

    .line 3442
    .local v2, "containsKey":Z
    :cond_c
    invoke-static {v3}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1d

    .line 3444
    const/4 v4, 0x0

    :try_start_13
    invoke-static {v3, v4}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    .line 3445
    .local v1, "address":[Lkorex/mail/Address;
    array-length v4, v1

    if-lez v4, :cond_1d

    .line 3446
    invoke-virtual {p1, p3, v1}, Lkorex/mail/Message;->setRecipients(Lkorex/mail/Message$RecipientType;[Lkorex/mail/Address;)V
    :try_end_1d
    .catch Lkorex/mail/MessagingException; {:try_start_13 .. :try_end_1d} :catch_1e

    .line 3452
    .end local v1    # "address":[Lkorex/mail/Address;
    :cond_1d
    :goto_1d
    return v2

    .line 3448
    :catch_1e
    move-exception v0

    .line 3449
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_1d
.end method

.method private setReplyTo(Lkorex/mail/Message;)V
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 3381
    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v3

    const-string v4, "mail.reply.to"

    invoke-virtual {v3, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3382
    .local v2, "reply":Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1b

    .line 3384
    const/4 v3, 0x0

    :try_start_11
    invoke-static {v2, v3}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    .line 3385
    .local v1, "address":[Lkorex/mail/Address;
    array-length v3, v1

    if-lez v3, :cond_1b

    .line 3386
    invoke-virtual {p1, v1}, Lkorex/mail/Message;->setReplyTo([Lkorex/mail/Address;)V
    :try_end_1b
    .catch Lkorex/mail/MessagingException; {:try_start_11 .. :try_end_1b} :catch_1c

    .line 3392
    .end local v1    # "address":[Lkorex/mail/Address;
    :cond_1b
    :goto_1b
    return-void

    .line 3388
    :catch_1c
    move-exception v0

    .line 3389
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {p0, v3, v0, v4}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_1b
.end method

.method private setSender(Lkorex/mail/Message;)V
    .registers 9
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x1

    .line 3399
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v3, :cond_10

    instance-of v3, p1, Lkorex/mail/internet/MimeMessage;

    if-nez v3, :cond_10

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 3400
    :cond_10
    invoke-virtual {p1}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v3

    const-string v4, "mail.sender"

    invoke-virtual {v3, v4}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3401
    .local v2, "sender":Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3e

    .line 3403
    const/4 v3, 0x0

    .line 3404
    :try_start_21
    invoke-static {v2, v3}, Lkorex/mail/internet/InternetAddress;->parse(Ljava/lang/String;Z)[Lkorex/mail/internet/InternetAddress;

    move-result-object v1

    .line 3405
    .local v1, "address":[Lkorex/mail/internet/InternetAddress;
    array-length v3, v1

    if-lez v3, :cond_3e

    .line 3406
    check-cast p1, Lkorex/mail/internet/MimeMessage;

    .end local p1    # "msg":Lkorex/mail/Message;
    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-virtual {p1, v3}, Lkorex/mail/internet/MimeMessage;->setSender(Lkorex/mail/Address;)V

    .line 3407
    array-length v3, v1

    if-le v3, v5, :cond_3e

    .line 3408
    const-string v3, "Ignoring other senders."

    const/4 v4, 0x1

    .line 3409
    invoke-direct {p0, v1, v4}, Lcom/sun/mail/util/logging/MailHandler;->tooManyAddresses([Lkorex/mail/Address;I)Lkorex/mail/internet/AddressException;

    move-result-object v4

    const/4 v5, 0x5

    .line 3408
    invoke-virtual {p0, v3, v4, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_3e
    .catch Lkorex/mail/MessagingException; {:try_start_21 .. :try_end_3e} :catch_3f

    .line 3417
    .end local v1    # "address":[Lkorex/mail/internet/InternetAddress;
    :cond_3e
    :goto_3e
    return-void

    .line 3413
    :catch_3f
    move-exception v0

    .line 3414
    .local v0, "ME":Lkorex/mail/MessagingException;
    invoke-virtual {v0}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v0, v6}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_3e
.end method

.method private sort()V
    .registers 6

    .prologue
    .line 2286
    sget-boolean v1, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 2287
    :cond_10
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    if-eqz v1, :cond_23

    .line 2289
    :try_start_14
    iget v1, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_24

    .line 2290
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    const/4 v2, 0x0

    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    invoke-static {v1, v2, v3, v4}, Ljava/util/Arrays;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    .line 2298
    :cond_23
    :goto_23
    return-void

    .line 2292
    :cond_24
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-interface {v1, v2, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    :try_end_33
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_33} :catch_34

    goto :goto_23

    .line 2294
    :catch_34
    move-exception v0

    .line 2295
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_23
.end method

.method private tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "f"    # Ljava/util/logging/Formatter;
    .param p2, "def"    # Ljava/lang/String;

    .prologue
    .line 3223
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/util/logging/Formatter;->getTail(Ljava/util/logging/Handler;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object p2

    .line 3226
    .end local p2    # "def":Ljava/lang/String;
    :goto_4
    return-object p2

    .line 3224
    .restart local p2    # "def":Ljava/lang/String;
    :catch_5
    move-exception v0

    .line 3225
    .local v0, "RE":Ljava/lang/RuntimeException;
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_4
.end method

.method private toMsgString(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 3481
    if-nez p1, :cond_5

    .line 3482
    const-string v4, "null"

    .line 3499
    :goto_4
    return-object v4

    .line 3485
    :cond_5
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncodingName()Ljava/lang/String;

    move-result-object v1

    .line 3487
    .local v1, "encoding":Ljava/lang/String;
    :try_start_9
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    const/16 v4, 0x400

    invoke-direct {v2, v4}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 3491
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/PrintWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    invoke-direct {v4, v2, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 3493
    .local v3, "pw":Ljava/io/PrintWriter;
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3494
    invoke-virtual {p1, v3}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 3495
    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    .line 3496
    invoke-virtual {v3}, Ljava/io/PrintWriter;->close()V

    .line 3497
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_2d} :catch_2f

    move-result-object v4

    goto :goto_4

    .line 3498
    .end local v2    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "pw":Ljava/io/PrintWriter;
    :catch_2f
    move-exception v0

    .line 3499
    .local v0, "badMimeCharset":Ljava/io/IOException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4
.end method

.method private toRawString(Lkorex/mail/Message;)Ljava/lang/String;
    .registers 6
    .param p1, "msg"    # Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3465
    if-eqz p1, :cond_1d

    .line 3466
    invoke-virtual {p1}, Lkorex/mail/Message;->getSize()I

    move-result v2

    add-int/lit16 v2, v2, 0x400

    const/16 v3, 0x400

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 3467
    .local v0, "nbytes":I
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 3468
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p1, v1}, Lkorex/mail/Message;->writeTo(Ljava/io/OutputStream;)V

    .line 3469
    const-string v2, "US-ASCII"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 3471
    .end local v0    # "nbytes":I
    .end local v1    # "out":Ljava/io/ByteArrayOutputStream;
    :goto_1c
    return-object v2

    :cond_1d
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method private toString(Ljava/util/logging/Formatter;)Ljava/lang/String;
    .registers 4
    .param p1, "f"    # Ljava/util/logging/Formatter;

    .prologue
    .line 2956
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2957
    .local v0, "name":Ljava/lang/String;
    invoke-static {v0}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 2960
    .end local v0    # "name":Ljava/lang/String;
    :goto_a
    return-object v0

    .restart local v0    # "name":Ljava/lang/String;
    :cond_b
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->getClassId(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method private tooManyAddresses([Lkorex/mail/Address;I)Lkorex/mail/internet/AddressException;
    .registers 6
    .param p1, "address"    # [Lkorex/mail/Address;
    .param p2, "offset"    # I

    .prologue
    .line 3426
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    array-length v2, p1

    invoke-interface {v1, p2, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 3427
    .local v0, "l":Ljava/util/List;
    new-instance v1, Lkorex/mail/internet/AddressException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lkorex/mail/internet/AddressException;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private tryMutex()Z
    .registers 3

    .prologue
    .line 668
    sget-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_11

    .line 669
    sget-object v0, Lcom/sun/mail/util/logging/MailHandler;->MUTEX:Ljava/lang/ThreadLocal;

    sget-object v1, Lcom/sun/mail/util/logging/MailHandler;->MUTEX_PUBLISH:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 670
    const/4 v0, 0x1

    .line 672
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private static verifyAddresses([Lkorex/mail/Address;)V
    .registers 4
    .param p0, "all"    # [Lkorex/mail/Address;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 2743
    if-eqz p0, :cond_14

    .line 2744
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    array-length v2, p0

    if-ge v1, v2, :cond_14

    .line 2745
    aget-object v0, p0, v1

    .line 2746
    .local v0, "a":Lkorex/mail/Address;
    instance-of v2, v0, Lkorex/mail/internet/InternetAddress;

    if-eqz v2, :cond_11

    .line 2747
    check-cast v0, Lkorex/mail/internet/InternetAddress;

    .end local v0    # "a":Lkorex/mail/Address;
    invoke-virtual {v0}, Lkorex/mail/internet/InternetAddress;->validate()V

    .line 2744
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 2751
    .end local v1    # "i":I
    :cond_14
    return-void
.end method

.method private static verifyHost(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 3
    .param p0, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2723
    invoke-static {p0}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 2724
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v0

    .line 2728
    .local v0, "a":Ljava/net/InetAddress;
    :goto_a
    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1f

    .line 2729
    new-instance v1, Ljava/net/UnknownHostException;

    invoke-direct {v1}, Ljava/net/UnknownHostException;-><init>()V

    throw v1

    .line 2726
    .end local v0    # "a":Ljava/net/InetAddress;
    :cond_1a
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .restart local v0    # "a":Ljava/net/InetAddress;
    goto :goto_a

    .line 2731
    :cond_1f
    return-object v0
.end method

.method private verifySettings(Lkorex/mail/Session;)V
    .registers 7
    .param p1, "session"    # Lkorex/mail/Session;

    .prologue
    .line 2462
    if-eqz p1, :cond_1e

    .line 2463
    invoke-virtual {p1}, Lkorex/mail/Session;->getProperties()Ljava/util/Properties;

    move-result-object v1

    .line 2464
    .local v1, "props":Ljava/util/Properties;
    const-string v3, "verify"

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2465
    .local v0, "check":Ljava/lang/Object;
    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_1f

    move-object v2, v0

    .line 2466
    check-cast v2, Ljava/lang/String;

    .line 2468
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Lcom/sun/mail/util/logging/MailHandler;->hasValue(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 2469
    invoke-direct {p0, p1, v2}, Lcom/sun/mail/util/logging/MailHandler;->verifySettings0(Lkorex/mail/Session;Ljava/lang/String;)V

    .line 2477
    .end local v0    # "check":Ljava/lang/Object;
    .end local v1    # "props":Ljava/util/Properties;
    .end local v2    # "value":Ljava/lang/String;
    :cond_1e
    :goto_1e
    return-void

    .line 2472
    .restart local v0    # "check":Ljava/lang/Object;
    .restart local v1    # "props":Ljava/util/Properties;
    :cond_1f
    if-eqz v0, :cond_1e

    .line 2473
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/sun/mail/util/logging/MailHandler;->verifySettings0(Lkorex/mail/Session;Ljava/lang/String;)V

    goto :goto_1e
.end method

.method private verifySettings0(Lkorex/mail/Session;Ljava/lang/String;)V
    .registers 31
    .param p1, "session"    # Lkorex/mail/Session;
    .param p2, "verify"    # Ljava/lang/String;

    .prologue
    .line 2491
    sget-boolean v25, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v25, :cond_14

    if-nez p2, :cond_14

    new-instance v26, Ljava/lang/AssertionError;

    const/16 v25, 0x0

    check-cast v25, Ljava/lang/String;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v26

    .line 2492
    :cond_14
    const-string v25, "local"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_5d

    const-string v25, "remote"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_5d

    const-string v25, "limited"

    .line 2493
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_5d

    const-string v25, "resolve"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_5d

    .line 2494
    const-string v25, "Verify must be \'limited\', local\', \'resolve\' or \'remote\'."

    new-instance v26, Ljava/lang/IllegalArgumentException;

    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    const/16 v27, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 2712
    :goto_5c
    return-void

    .line 2501
    :cond_5d
    new-instance v8, Lkorex/mail/internet/MimeMessage;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 2503
    .local v8, "abort":Lkorex/mail/internet/MimeMessage;
    const-string v25, "limited"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_25e

    .line 2504
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Local address is "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    .line 2505
    invoke-static/range {p1 .. p1}, Lkorex/mail/internet/InternetAddress;->getLocalAddress(Lkorex/mail/Session;)Lkorex/mail/internet/InternetAddress;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const/16 v26, 0x2e

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2508
    .local v18, "msg":Ljava/lang/String;
    :try_start_8d
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncodingName()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_94
    .catch Ljava/lang/RuntimeException; {:try_start_8d .. :try_end_94} :catch_242

    .line 2520
    :goto_94
    monitor-enter p0

    .line 2521
    :try_start_95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v8, v1}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 2522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    const-string v26, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v8, v1}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 2523
    monitor-exit p0
    :try_end_c4
    .catchall {:try_start_95 .. :try_end_c4} :catchall_262

    .line 2525
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/sun/mail/util/logging/MailHandler;->setIncompleteCopy(Lkorex/mail/Message;)V

    .line 2526
    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v1}, Lcom/sun/mail/util/logging/MailHandler;->envelopeFor(Lkorex/mail/Message;Z)V

    .line 2528
    :try_start_d2
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->saveChanges()V
    :try_end_d5
    .catch Lkorex/mail/MessagingException; {:try_start_d2 .. :try_end_d5} :catch_265

    .line 2535
    :goto_d5
    :try_start_d5
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->getAllRecipients()[Lkorex/mail/Address;

    move-result-object v9

    .line 2536
    .local v9, "all":[Lkorex/mail/Address;
    if-nez v9, :cond_e1

    .line 2537
    const/16 v25, 0x0

    move/from16 v0, v25

    new-array v9, v0, [Lkorex/mail/internet/InternetAddress;
    :try_end_e1
    .catch Lkorex/mail/MessagingException; {:try_start_d5 .. :try_end_e1} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_d5 .. :try_end_e1} :catch_2a1

    .line 2541
    :cond_e1
    :try_start_e1
    array-length v0, v9

    move/from16 v25, v0

    if-eqz v25, :cond_273

    move-object v10, v9

    .line 2542
    .local v10, "any":[Lkorex/mail/Address;
    :goto_e7
    if-eqz v10, :cond_279

    array-length v0, v10

    move/from16 v25, v0

    if-eqz v25, :cond_279

    .line 2543
    const/16 v25, 0x0

    aget-object v25, v10, v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getTransport(Lkorex/mail/Address;)Lkorex/mail/Transport;

    move-result-object v24

    .line 2544
    .local v24, "t":Lkorex/mail/Transport;
    const-string v25, "mail.transport.protocol"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_103
    .catch Lkorex/mail/MessagingException; {:try_start_e1 .. :try_end_103} :catch_292
    .catch Ljava/lang/RuntimeException; {:try_start_e1 .. :try_end_103} :catch_2a1

    .line 2559
    .end local v10    # "any":[Lkorex/mail/Address;
    :goto_103
    const/16 v16, 0x0

    .line 2560
    .local v16, "local":Ljava/lang/String;
    :try_start_105
    const-string v25, "remote"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_315

    .line 2561
    const/4 v12, 0x0

    .line 2562
    .local v12, "closed":Lkorex/mail/MessagingException;
    invoke-virtual/range {v24 .. v24}, Lkorex/mail/Transport;->connect()V
    :try_end_115
    .catch Lkorex/mail/MessagingException; {:try_start_105 .. :try_end_115} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_105 .. :try_end_115} :catch_2a1

    .line 2566
    :try_start_115
    move-object/from16 v0, v24

    instance-of v0, v0, Lcom/sun/mail/smtp/SMTPTransport;

    move/from16 v25, v0

    if-eqz v25, :cond_127

    .line 2567
    move-object/from16 v0, v24

    check-cast v0, Lcom/sun/mail/smtp/SMTPTransport;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v16

    .line 2572
    :cond_127
    move-object/from16 v0, v24

    invoke-virtual {v0, v8, v9}, Lkorex/mail/Transport;->sendMessage(Lkorex/mail/Message;[Lkorex/mail/Address;)V
    :try_end_12c
    .catchall {:try_start_115 .. :try_end_12c} :catchall_2b8

    .line 2575
    :try_start_12c
    invoke-virtual/range {v24 .. v24}, Lkorex/mail/Transport;->close()V
    :try_end_12f
    .catch Lkorex/mail/MessagingException; {:try_start_12c .. :try_end_12f} :catch_2b4
    .catch Lkorex/mail/SendFailedException; {:try_start_12c .. :try_end_12f} :catch_2bd
    .catch Ljava/lang/RuntimeException; {:try_start_12c .. :try_end_12f} :catch_2a1

    .line 2580
    :goto_12f
    const/16 v25, 0x0

    :try_start_131
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v25

    invoke-direct {v0, v8, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportUnexpectedSend(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_13a
    .catch Lkorex/mail/SendFailedException; {:try_start_131 .. :try_end_13a} :catch_2bd
    .catch Lkorex/mail/MessagingException; {:try_start_131 .. :try_end_13a} :catch_2fa
    .catch Ljava/lang/RuntimeException; {:try_start_131 .. :try_end_13a} :catch_2a1

    .line 2599
    :cond_13a
    :goto_13a
    if-eqz v12, :cond_14c

    .line 2600
    :try_start_13c
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v12}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2601
    const/16 v25, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v12, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    .line 2634
    .end local v12    # "closed":Lkorex/mail/MessagingException;
    :cond_14c
    :goto_14c
    const-string v25, "limited"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_155
    .catch Lkorex/mail/MessagingException; {:try_start_13c .. :try_end_155} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_13c .. :try_end_155} :catch_2a1

    move-result v25

    if-nez v25, :cond_1b6

    .line 2636
    :try_start_158
    const-string v25, "remote"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_172

    move-object/from16 v0, v24

    instance-of v0, v0, Lcom/sun/mail/smtp/SMTPTransport;

    move/from16 v25, v0

    if-eqz v25, :cond_172

    .line 2638
    check-cast v24, Lcom/sun/mail/smtp/SMTPTransport;

    .end local v24    # "t":Lkorex/mail/Transport;
    invoke-virtual/range {v24 .. v24}, Lcom/sun/mail/smtp/SMTPTransport;->getLocalHost()Ljava/lang/String;

    move-result-object v16

    .line 2640
    :cond_172
    invoke-static/range {v16 .. v16}, Lcom/sun/mail/util/logging/MailHandler;->verifyHost(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_175
    .catch Ljava/io/IOException; {:try_start_158 .. :try_end_175} :catch_438
    .catch Ljava/lang/RuntimeException; {:try_start_158 .. :try_end_175} :catch_452
    .catch Lkorex/mail/MessagingException; {:try_start_158 .. :try_end_175} :catch_22f

    .line 2653
    :goto_175
    :try_start_175
    new-instance v19, Lkorex/mail/internet/MimeMultipart;

    invoke-direct/range {v19 .. v19}, Lkorex/mail/internet/MimeMultipart;-><init>()V

    .line 2654
    .local v19, "multipart":Lkorex/mail/internet/MimeMultipart;
    new-instance v11, Lkorex/mail/internet/MimeBodyPart;

    invoke-direct {v11}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 2655
    .local v11, "body":Lkorex/mail/internet/MimeBodyPart;
    const-string v25, "inline"

    move-object/from16 v0, v25

    invoke-virtual {v11, v0}, Lkorex/mail/internet/MimeBodyPart;->setDisposition(Ljava/lang/String;)V

    .line 2656
    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lkorex/mail/internet/MimeBodyPart;->setDescription(Ljava/lang/String;)V

    .line 2657
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/sun/mail/util/logging/MailHandler;->setAcceptLang(Lkorex/mail/Part;)V

    .line 2658
    const-string v25, ""

    const-string v26, "text/plain"

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v11, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->setContent(Lkorex/mail/internet/MimeBodyPart;Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 2659
    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Lkorex/mail/internet/MimeMultipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 2660
    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lkorex/mail/internet/MimeMessage;->setContent(Lkorex/mail/Multipart;)V

    .line 2661
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->saveChanges()V

    .line 2662
    new-instance v25, Ljava/io/ByteArrayOutputStream;

    const/16 v26, 0x400

    invoke-direct/range {v25 .. v26}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    move-object/from16 v0, v25

    invoke-virtual {v8, v0}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;)V
    :try_end_1b6
    .catch Ljava/io/IOException; {:try_start_175 .. :try_end_1b6} :catch_46c
    .catch Lkorex/mail/MessagingException; {:try_start_175 .. :try_end_1b6} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_175 .. :try_end_1b6} :catch_2a1

    .line 2671
    .end local v11    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v19    # "multipart":Lkorex/mail/internet/MimeMultipart;
    :cond_1b6
    :goto_1b6
    :try_start_1b6
    array-length v0, v9

    move/from16 v25, v0

    if-eqz v25, :cond_486

    .line 2672
    invoke-static {v9}, Lcom/sun/mail/util/logging/MailHandler;->verifyAddresses([Lkorex/mail/Address;)V

    .line 2678
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v14

    .line 2679
    .local v14, "from":[Lkorex/mail/Address;
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->getSender()Lkorex/mail/Address;

    move-result-object v22

    .line 2680
    .local v22, "sender":Lkorex/mail/Address;
    move-object/from16 v0, v22

    instance-of v0, v0, Lkorex/mail/internet/InternetAddress;

    move/from16 v25, v0

    if-eqz v25, :cond_1d7

    .line 2681
    move-object/from16 v0, v22

    check-cast v0, Lkorex/mail/internet/InternetAddress;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lkorex/mail/internet/InternetAddress;->validate()V

    .line 2685
    :cond_1d7
    const-string v25, "From"

    const-string v26, ","

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v8, v0, v1}, Lkorex/mail/internet/MimeMessage;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    if-eqz v25, :cond_492

    array-length v0, v14

    move/from16 v25, v0

    if-eqz v25, :cond_492

    .line 2686
    invoke-static {v14}, Lcom/sun/mail/util/logging/MailHandler;->verifyAddresses([Lkorex/mail/Address;)V

    .line 2687
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1ee
    array-length v0, v14

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v15, v0, :cond_4a7

    .line 2688
    aget-object v25, v14, v15

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lkorex/mail/Address;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-eqz v25, :cond_48e

    .line 2689
    new-instance v5, Lkorex/mail/MessagingException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Sender address \'"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "\' equals from address."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-direct {v5, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 2692
    .local v5, "ME":Lkorex/mail/MessagingException;
    new-instance v25, Lkorex/mail/MessagingException;

    move-object/from16 v0, v25

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v25
    :try_end_22f
    .catch Lkorex/mail/MessagingException; {:try_start_1b6 .. :try_end_22f} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_1b6 .. :try_end_22f} :catch_2a1

    .line 2705
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    .end local v9    # "all":[Lkorex/mail/Address;
    .end local v14    # "from":[Lkorex/mail/Address;
    .end local v15    # "i":I
    .end local v16    # "local":Ljava/lang/String;
    .end local v22    # "sender":Lkorex/mail/Address;
    :catch_22f
    move-exception v5

    .line 2706
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2707
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_5c

    .line 2509
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :catch_242
    move-exception v6

    .line 2510
    .local v6, "RE":Ljava/lang/RuntimeException;
    new-instance v7, Ljava/io/UnsupportedEncodingException;

    .line 2511
    invoke-virtual {v6}, Ljava/lang/RuntimeException;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-direct {v7, v0}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    .line 2512
    .local v7, "UEE":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v7, v6}, Ljava/io/UnsupportedEncodingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 2513
    const/16 v25, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v25

    invoke-virtual {v0, v1, v7, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto/16 :goto_94

    .line 2516
    .end local v6    # "RE":Ljava/lang/RuntimeException;
    .end local v7    # "UEE":Ljava/io/UnsupportedEncodingException;
    .end local v18    # "msg":Ljava/lang/String;
    :cond_25e
    const-string v18, "Skipping local address check."

    .restart local v18    # "msg":Ljava/lang/String;
    goto/16 :goto_94

    .line 2523
    :catchall_262
    move-exception v25

    :try_start_263
    monitor-exit p0
    :try_end_264
    .catchall {:try_start_263 .. :try_end_264} :catchall_262

    throw v25

    .line 2529
    :catch_265
    move-exception v5

    .line 2530
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    const/16 v25, 0x5

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v25

    invoke-virtual {v0, v1, v5, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto/16 :goto_d5

    .line 2541
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    .restart local v9    # "all":[Lkorex/mail/Address;
    :cond_273
    :try_start_273
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->getFrom()[Lkorex/mail/Address;

    move-result-object v10

    goto/16 :goto_e7

    .line 2546
    .restart local v10    # "any":[Lkorex/mail/Address;
    :cond_279
    new-instance v17, Lkorex/mail/MessagingException;

    const-string v25, "No recipient or from address."

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 2548
    .local v17, "me":Lkorex/mail/MessagingException;
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v17

    move/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 2549
    throw v17
    :try_end_292
    .catch Lkorex/mail/MessagingException; {:try_start_273 .. :try_end_292} :catch_292
    .catch Ljava/lang/RuntimeException; {:try_start_273 .. :try_end_292} :catch_2a1

    .line 2551
    .end local v10    # "any":[Lkorex/mail/Address;
    .end local v17    # "me":Lkorex/mail/MessagingException;
    :catch_292
    move-exception v20

    .line 2553
    .local v20, "protocol":Lkorex/mail/MessagingException;
    :try_start_293
    invoke-virtual/range {p1 .. p1}, Lkorex/mail/Session;->getTransport()Lkorex/mail/Transport;
    :try_end_296
    .catch Lkorex/mail/MessagingException; {:try_start_293 .. :try_end_296} :catch_299
    .catch Ljava/lang/RuntimeException; {:try_start_293 .. :try_end_296} :catch_2a1

    move-result-object v24

    .restart local v24    # "t":Lkorex/mail/Transport;
    goto/16 :goto_103

    .line 2554
    .end local v24    # "t":Lkorex/mail/Transport;
    :catch_299
    move-exception v13

    .line 2555
    .local v13, "fail":Lkorex/mail/MessagingException;
    :try_start_29a
    move-object/from16 v0, v20

    invoke-static {v0, v13}, Lcom/sun/mail/util/logging/MailHandler;->attach(Lkorex/mail/MessagingException;Ljava/lang/Exception;)Lkorex/mail/MessagingException;

    move-result-object v25

    throw v25
    :try_end_2a1
    .catch Lkorex/mail/MessagingException; {:try_start_29a .. :try_end_2a1} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_29a .. :try_end_2a1} :catch_2a1

    .line 2708
    .end local v9    # "all":[Lkorex/mail/Address;
    .end local v13    # "fail":Lkorex/mail/MessagingException;
    .end local v20    # "protocol":Lkorex/mail/MessagingException;
    :catch_2a1
    move-exception v6

    .line 2709
    .restart local v6    # "RE":Ljava/lang/RuntimeException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v6}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2710
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v6, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_5c

    .line 2576
    .end local v6    # "RE":Ljava/lang/RuntimeException;
    .restart local v9    # "all":[Lkorex/mail/Address;
    .restart local v12    # "closed":Lkorex/mail/MessagingException;
    .restart local v16    # "local":Ljava/lang/String;
    .restart local v24    # "t":Lkorex/mail/Transport;
    :catch_2b4
    move-exception v5

    .line 2577
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object v12, v5

    .line 2579
    goto/16 :goto_12f

    .line 2574
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :catchall_2b8
    move-exception v25

    .line 2575
    :try_start_2b9
    invoke-virtual/range {v24 .. v24}, Lkorex/mail/Transport;->close()V
    :try_end_2bc
    .catch Lkorex/mail/MessagingException; {:try_start_2b9 .. :try_end_2bc} :catch_2f7
    .catch Lkorex/mail/SendFailedException; {:try_start_2b9 .. :try_end_2bc} :catch_2bd
    .catch Ljava/lang/RuntimeException; {:try_start_2b9 .. :try_end_2bc} :catch_2a1

    .line 2578
    :goto_2bc
    :try_start_2bc
    throw v25
    :try_end_2bd
    .catch Lkorex/mail/SendFailedException; {:try_start_2bc .. :try_end_2bd} :catch_2bd
    .catch Lkorex/mail/MessagingException; {:try_start_2bc .. :try_end_2bd} :catch_2fa
    .catch Ljava/lang/RuntimeException; {:try_start_2bc .. :try_end_2bd} :catch_2a1

    .line 2581
    :catch_2bd
    move-exception v23

    .line 2582
    .local v23, "sfe":Lkorex/mail/SendFailedException;
    :try_start_2be
    invoke-virtual/range {v23 .. v23}, Lkorex/mail/SendFailedException;->getInvalidAddresses()[Lkorex/mail/Address;

    move-result-object v21

    .line 2583
    .local v21, "recip":[Lkorex/mail/Address;
    if-eqz v21, :cond_2df

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v25, v0

    if-eqz v25, :cond_2df

    .line 2584
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v23

    invoke-direct {v0, v8, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2585
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v25

    invoke-direct {v0, v8, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    .line 2588
    :cond_2df
    invoke-virtual/range {v23 .. v23}, Lkorex/mail/SendFailedException;->getValidSentAddresses()[Lkorex/mail/Address;

    move-result-object v21

    .line 2589
    if-eqz v21, :cond_13a

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v25, v0

    if-eqz v25, :cond_13a

    .line 2590
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v23

    invoke-direct {v0, v8, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportUnexpectedSend(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_13a

    .line 2576
    .end local v21    # "recip":[Lkorex/mail/Address;
    .end local v23    # "sfe":Lkorex/mail/SendFailedException;
    :catch_2f7
    move-exception v5

    .line 2577
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object v12, v5

    goto :goto_2bc

    .line 2592
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :catch_2fa
    move-exception v5

    .line 2593
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v5}, Lcom/sun/mail/util/logging/MailHandler;->isMissingContent(Lkorex/mail/Message;Ljava/lang/Throwable;)Z

    move-result v25

    if-nez v25, :cond_13a

    .line 2594
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2595
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_13a

    .line 2605
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    .end local v12    # "closed":Lkorex/mail/MessagingException;
    :cond_315
    invoke-virtual/range {v24 .. v24}, Lkorex/mail/Transport;->getURLName()Lkorex/mail/URLName;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lkorex/mail/URLName;->getProtocol()Ljava/lang/String;

    move-result-object v20

    .line 2606
    .local v20, "protocol":Ljava/lang/String;
    const-string v25, "mail.host"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2607
    const-string v25, "mail.user"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2608
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mail."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ".host"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2609
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mail."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ".port"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2610
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mail."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ".user"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 2611
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mail."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ".localhost"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 2612
    invoke-static/range {v16 .. v16}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_3eb

    .line 2613
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mail."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ".localaddress"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/Session;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 2617
    :cond_3eb
    const-string v25, "resolve"

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3f4
    .catch Lkorex/mail/MessagingException; {:try_start_2be .. :try_end_3f4} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_2be .. :try_end_3f4} :catch_2a1

    move-result v25

    if-eqz v25, :cond_14c

    .line 2619
    :try_start_3f7
    invoke-virtual/range {v24 .. v24}, Lkorex/mail/Transport;->getURLName()Lkorex/mail/URLName;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Lkorex/mail/URLName;->getHost()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/sun/mail/util/logging/MailHandler;->verifyHost(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_402
    .catch Ljava/io/IOException; {:try_start_3f7 .. :try_end_402} :catch_404
    .catch Ljava/lang/RuntimeException; {:try_start_3f7 .. :try_end_402} :catch_41e
    .catch Lkorex/mail/MessagingException; {:try_start_3f7 .. :try_end_402} :catch_22f

    goto/16 :goto_14c

    .line 2620
    :catch_404
    move-exception v4

    .line 2621
    .local v4, "IOE":Ljava/io/IOException;
    :try_start_405
    new-instance v5, Lkorex/mail/MessagingException;

    move-object/from16 v0, v18

    invoke-direct {v5, v0, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2623
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2624
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_14c

    .line 2625
    .end local v4    # "IOE":Ljava/io/IOException;
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :catch_41e
    move-exception v6

    .line 2626
    .restart local v6    # "RE":Ljava/lang/RuntimeException;
    new-instance v5, Lkorex/mail/MessagingException;

    move-object/from16 v0, v18

    invoke-direct {v5, v0, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2628
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v6}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2629
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_14c

    .line 2641
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    .end local v6    # "RE":Ljava/lang/RuntimeException;
    .end local v20    # "protocol":Ljava/lang/String;
    .end local v24    # "t":Lkorex/mail/Transport;
    :catch_438
    move-exception v4

    .line 2642
    .restart local v4    # "IOE":Ljava/io/IOException;
    new-instance v5, Lkorex/mail/MessagingException;

    move-object/from16 v0, v18

    invoke-direct {v5, v0, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2643
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2644
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_175

    .line 2645
    .end local v4    # "IOE":Ljava/io/IOException;
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :catch_452
    move-exception v6

    .line 2646
    .restart local v6    # "RE":Ljava/lang/RuntimeException;
    new-instance v5, Lkorex/mail/MessagingException;

    move-object/from16 v0, v18

    invoke-direct {v5, v0, v6}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2647
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2648
    const/16 v25, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_175

    .line 2663
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    .end local v6    # "RE":Ljava/lang/RuntimeException;
    :catch_46c
    move-exception v4

    .line 2664
    .restart local v4    # "IOE":Ljava/io/IOException;
    new-instance v5, Lkorex/mail/MessagingException;

    move-object/from16 v0, v18

    invoke-direct {v5, v0, v4}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 2665
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v8, v1, v5}, Lcom/sun/mail/util/logging/MailHandler;->fixUpContent(Lkorex/mail/internet/MimeMessage;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2666
    const/16 v25, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v0, v8, v5, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Lkorex/mail/Message;Ljava/lang/Exception;I)V

    goto/16 :goto_1b6

    .line 2674
    .end local v4    # "IOE":Ljava/io/IOException;
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :cond_486
    new-instance v25, Lkorex/mail/MessagingException;

    const-string v26, "No recipient addresses."

    invoke-direct/range {v25 .. v26}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v25

    .line 2687
    .restart local v14    # "from":[Lkorex/mail/Address;
    .restart local v15    # "i":I
    .restart local v22    # "sender":Lkorex/mail/Address;
    :cond_48e
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1ee

    .line 2696
    .end local v15    # "i":I
    :cond_492
    if-nez v22, :cond_4a7

    .line 2697
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v25, "No from or sender address."

    move-object/from16 v0, v25

    invoke-direct {v5, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 2699
    .restart local v5    # "ME":Lkorex/mail/MessagingException;
    new-instance v25, Lkorex/mail/MessagingException;

    move-object/from16 v0, v25

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v25

    .line 2704
    .end local v5    # "ME":Lkorex/mail/MessagingException;
    :cond_4a7
    invoke-virtual {v8}, Lkorex/mail/internet/MimeMessage;->getReplyTo()[Lkorex/mail/Address;

    move-result-object v25

    invoke-static/range {v25 .. v25}, Lcom/sun/mail/util/logging/MailHandler;->verifyAddresses([Lkorex/mail/Address;)V
    :try_end_4ae
    .catch Lkorex/mail/MessagingException; {:try_start_405 .. :try_end_4ae} :catch_22f
    .catch Ljava/lang/RuntimeException; {:try_start_405 .. :try_end_4ae} :catch_2a1

    goto/16 :goto_5c
.end method

.method private declared-synchronized writeLogRecords(I)Lkorex/mail/Message;
    .registers 30
    .param p1, "code"    # I

    .prologue
    .line 2310
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v25, v0

    if-eqz v25, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    move/from16 v25, v0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_2e6

    if-eqz v25, :cond_15

    .line 2311
    :cond_11
    const/16 v19, 0x0

    .line 2449
    :cond_13
    :goto_13
    monitor-exit p0

    return-object v19

    .line 2314
    :cond_15
    const/16 v25, 0x1

    :try_start_17
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z
    :try_end_1d
    .catchall {:try_start_17 .. :try_end_1d} :catchall_2e6

    .line 2316
    :try_start_1d
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->sort()V

    .line 2317
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    move-object/from16 v25, v0

    if-nez v25, :cond_2b

    .line 2318
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->initSession()Lkorex/mail/Session;

    .line 2320
    :cond_2b
    new-instance v19, Lkorex/mail/internet/MimeMessage;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->session:Lkorex/mail/Session;

    move-object/from16 v25, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;)V

    .line 2321
    .local v19, "msg":Lkorex/mail/internet/MimeMessage;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->descriptionFrom(Ljava/util/Comparator;Ljava/util/logging/Level;Ljava/util/logging/Filter;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeMessage;->setDescription(Ljava/lang/String;)V

    .line 2328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v0, v0, [Lkorex/mail/internet/MimeBodyPart;

    move-object/from16 v22, v0

    .line 2333
    .local v22, "parts":[Lkorex/mail/internet/MimeBodyPart;
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    new-array v10, v0, [Ljava/lang/StringBuilder;

    .line 2335
    .local v10, "buffers":[Ljava/lang/StringBuilder;
    const/4 v11, 0x0

    .line 2336
    .local v11, "contentType":Ljava/lang/String;
    const/4 v9, 0x0

    .line 2338
    .local v9, "buf":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 2340
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->createBodyPart()Lkorex/mail/internet/MimeBodyPart;

    move-result-object v6

    .line 2341
    .local v6, "body":Lkorex/mail/internet/MimeBodyPart;
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->getFormatter()Ljava/util/logging/Formatter;

    move-result-object v8

    .line 2342
    .local v8, "bodyFormat":Ljava/util/logging/Formatter;
    invoke-virtual/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v7

    .line 2344
    .local v7, "bodyFilter":Ljava/util/logging/Filter;
    const/16 v17, 0x0

    .line 2345
    .local v17, "lastLocale":Ljava/util/Locale;
    const/16 v16, 0x0

    .local v16, "ix":I
    :goto_a2
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v25, v0

    move/from16 v0, v16

    move/from16 v1, v25

    if-ge v0, v1, :cond_21e

    .line 2346
    const/4 v13, 0x0

    .line 2347
    .local v13, "formatted":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    move-object/from16 v25, v0

    aget-object v23, v25, v16

    .line 2348
    .local v23, "r":Ljava/util/logging/LogRecord;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v26, v25, v16

    .line 2350
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->localeFor(Ljava/util/logging/LogRecord;)Ljava/util/Locale;

    move-result-object v18

    .line 2351
    .local v18, "locale":Ljava/util/Locale;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 2353
    if-eqz v7, :cond_ec

    move-object/from16 v0, v23

    invoke-interface {v7, v0}, Ljava/util/logging/Filter;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v25

    if-eqz v25, :cond_123

    .line 2354
    :cond_ec
    if-nez v9, :cond_102

    .line 2355
    new-instance v9, Ljava/lang/StringBuilder;

    .end local v9    # "buf":Ljava/lang/StringBuilder;
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 2356
    .restart local v9    # "buf":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v14

    .line 2357
    .local v14, "head":Ljava/lang/String;
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2358
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/sun/mail/util/logging/MailHandler;->contentTypeOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 2360
    .end local v14    # "head":Ljava/lang/String;
    :cond_102
    const/4 v13, 0x1

    .line 2361
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v8, v1}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2362
    if-eqz v18, :cond_123

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_123

    .line 2363
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v6, v1}, Lcom/sun/mail/util/logging/MailHandler;->appendContentLang(Lkorex/mail/internet/MimePart;Ljava/util/Locale;)V

    .line 2367
    :cond_123
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_124
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v15, v0, :cond_1d2

    .line 2368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    move-object/from16 v25, v0

    aget-object v4, v25, v15

    .line 2369
    .local v4, "af":Ljava/util/logging/Filter;
    if-eqz v4, :cond_13f

    move-object/from16 v0, v23

    invoke-interface {v4, v0}, Ljava/util/logging/Filter;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v25

    if-eqz v25, :cond_1ce

    .line 2370
    :cond_13f
    aget-object v25, v22, v15

    if-nez v25, :cond_182

    .line 2371
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/sun/mail/util/logging/MailHandler;->createBodyPart(I)Lkorex/mail/internet/MimeBodyPart;

    move-result-object v25

    aput-object v25, v22, v15

    .line 2372
    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    aput-object v25, v10, v15

    .line 2373
    aget-object v25, v10, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2374
    aget-object v25, v22, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->head(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendFileName(Lkorex/mail/Part;Ljava/lang/String;)V

    .line 2376
    :cond_182
    const/4 v13, 0x1

    .line 2377
    aget-object v25, v22, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendFileName(Lkorex/mail/Part;Ljava/lang/String;)V

    .line 2378
    aget-object v25, v10, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->format(Ljava/util/logging/Formatter;Ljava/util/logging/LogRecord;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2379
    if-eqz v18, :cond_1ce

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_1ce

    .line 2380
    aget-object v25, v22, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendContentLang(Lkorex/mail/internet/MimePart;Ljava/util/Locale;)V

    .line 2367
    :cond_1ce
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_124

    .line 2385
    .end local v4    # "af":Ljava/util/logging/Filter;
    :cond_1d2
    if-eqz v13, :cond_1ef

    .line 2386
    if-eqz v18, :cond_1e9

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_1e9

    .line 2387
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendContentLang(Lkorex/mail/internet/MimePart;Ljava/util/Locale;)V

    .line 2392
    :cond_1e9
    :goto_1e9
    move-object/from16 v17, v18

    .line 2345
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_a2

    .line 2390
    :cond_1ef
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->reportFilterError(Ljava/util/logging/LogRecord;)V
    :try_end_1f6
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_1f6} :catch_1f7
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1f6} :catch_2c3
    .catchall {:try_start_1d .. :try_end_1f6} :catchall_374

    goto :goto_1e9

    .line 2439
    .end local v6    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v7    # "bodyFilter":Ljava/util/logging/Filter;
    .end local v8    # "bodyFormat":Ljava/util/logging/Formatter;
    .end local v9    # "buf":Ljava/lang/StringBuilder;
    .end local v10    # "buffers":[Ljava/lang/StringBuilder;
    .end local v11    # "contentType":Ljava/lang/String;
    .end local v13    # "formatted":Z
    .end local v15    # "i":I
    .end local v16    # "ix":I
    .end local v17    # "lastLocale":Ljava/util/Locale;
    .end local v18    # "locale":Ljava/util/Locale;
    .end local v19    # "msg":Lkorex/mail/internet/MimeMessage;
    .end local v22    # "parts":[Lkorex/mail/internet/MimeBodyPart;
    .end local v23    # "r":Ljava/util/logging/LogRecord;
    :catch_1f7
    move-exception v24

    .line 2440
    .local v24, "re":Ljava/lang/RuntimeException;
    :try_start_1f8
    invoke-virtual/range {v24 .. v24}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v24

    move/from16 v3, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_207
    .catchall {:try_start_1f8 .. :try_end_207} :catchall_374

    .line 2444
    const/16 v25, 0x0

    :try_start_209
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    .line 2445
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v25, v0

    if-lez v25, :cond_21a

    .line 2446
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->reset()V
    :try_end_21a
    .catchall {:try_start_209 .. :try_end_21a} :catchall_2e6

    .line 2449
    .end local v24    # "re":Ljava/lang/RuntimeException;
    :cond_21a
    :goto_21a
    const/16 v19, 0x0

    goto/16 :goto_13

    .line 2394
    .restart local v6    # "body":Lkorex/mail/internet/MimeBodyPart;
    .restart local v7    # "bodyFilter":Ljava/util/logging/Filter;
    .restart local v8    # "bodyFormat":Ljava/util/logging/Formatter;
    .restart local v9    # "buf":Ljava/lang/StringBuilder;
    .restart local v10    # "buffers":[Ljava/lang/StringBuilder;
    .restart local v11    # "contentType":Ljava/lang/String;
    .restart local v16    # "ix":I
    .restart local v17    # "lastLocale":Ljava/util/Locale;
    .restart local v19    # "msg":Lkorex/mail/internet/MimeMessage;
    .restart local v22    # "parts":[Lkorex/mail/internet/MimeBodyPart;
    :cond_21e
    const/16 v25, 0x0

    :try_start_220
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lcom/sun/mail/util/logging/MailHandler;->size:I

    .line 2396
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v25, v0

    add-int/lit8 v15, v25, -0x1

    .restart local v15    # "i":I
    :goto_22d
    if-ltz v15, :cond_2e9

    .line 2397
    aget-object v25, v22, v15

    if-eqz v25, :cond_2b3

    .line 2398
    aget-object v25, v22, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    const-string v27, "err"

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendFileName(Lkorex/mail/Part;Ljava/lang/String;)V

    .line 2399
    aget-object v25, v10, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    move-object/from16 v26, v0

    aget-object v26, v26, v15

    const-string v27, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2401
    aget-object v25, v10, v15

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->length()I

    move-result v25

    if-lez v25, :cond_2b7

    .line 2402
    aget-object v25, v22, v15

    invoke-virtual/range {v25 .. v25}, Lkorex/mail/internet/MimeBodyPart;->getFileName()Ljava/lang/String;

    move-result-object v21

    .line 2403
    .local v21, "name":Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_298

    .line 2404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    aget-object v25, v25, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->toString(Ljava/util/logging/Formatter;)Ljava/lang/String;

    move-result-object v21

    .line 2405
    aget-object v25, v22, v15

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeBodyPart;->setFileName(Ljava/lang/String;)V

    .line 2407
    :cond_298
    aget-object v25, v22, v15

    aget-object v26, v10, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-direct {v0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->setContent(Lkorex/mail/internet/MimeBodyPart;Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 2412
    .end local v21    # "name":Ljava/lang/String;
    :goto_2af
    const/16 v25, 0x0

    aput-object v25, v10, v15

    .line 2396
    :cond_2b3
    add-int/lit8 v15, v15, -0x1

    goto/16 :goto_22d

    .line 2409
    :cond_2b7
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->setIncompleteCopy(Lkorex/mail/Message;)V

    .line 2410
    const/16 v25, 0x0

    aput-object v25, v22, v15
    :try_end_2c2
    .catch Ljava/lang/RuntimeException; {:try_start_220 .. :try_end_2c2} :catch_1f7
    .catch Ljava/lang/Exception; {:try_start_220 .. :try_end_2c2} :catch_2c3
    .catchall {:try_start_220 .. :try_end_2c2} :catchall_374

    goto :goto_2af

    .line 2441
    .end local v6    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v7    # "bodyFilter":Ljava/util/logging/Filter;
    .end local v8    # "bodyFormat":Ljava/util/logging/Formatter;
    .end local v9    # "buf":Ljava/lang/StringBuilder;
    .end local v10    # "buffers":[Ljava/lang/StringBuilder;
    .end local v11    # "contentType":Ljava/lang/String;
    .end local v15    # "i":I
    .end local v16    # "ix":I
    .end local v17    # "lastLocale":Ljava/util/Locale;
    .end local v19    # "msg":Lkorex/mail/internet/MimeMessage;
    .end local v22    # "parts":[Lkorex/mail/internet/MimeBodyPart;
    :catch_2c3
    move-exception v12

    .line 2442
    .local v12, "e":Ljava/lang/Exception;
    :try_start_2c4
    invoke-virtual {v12}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, p1

    invoke-virtual {v0, v1, v12, v2}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_2d1
    .catchall {:try_start_2c4 .. :try_end_2d1} :catchall_374

    .line 2444
    const/16 v25, 0x0

    :try_start_2d3
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    .line 2445
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v25, v0

    if-lez v25, :cond_21a

    .line 2446
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->reset()V
    :try_end_2e4
    .catchall {:try_start_2d3 .. :try_end_2e4} :catchall_2e6

    goto/16 :goto_21a

    .line 2310
    .end local v12    # "e":Ljava/lang/Exception;
    :catchall_2e6
    move-exception v25

    monitor-exit p0

    throw v25

    .line 2416
    .restart local v6    # "body":Lkorex/mail/internet/MimeBodyPart;
    .restart local v7    # "bodyFilter":Ljava/util/logging/Filter;
    .restart local v8    # "bodyFormat":Ljava/util/logging/Formatter;
    .restart local v9    # "buf":Ljava/lang/StringBuilder;
    .restart local v10    # "buffers":[Ljava/lang/StringBuilder;
    .restart local v11    # "contentType":Ljava/lang/String;
    .restart local v15    # "i":I
    .restart local v16    # "ix":I
    .restart local v17    # "lastLocale":Ljava/util/Locale;
    .restart local v19    # "msg":Lkorex/mail/internet/MimeMessage;
    .restart local v22    # "parts":[Lkorex/mail/internet/MimeBodyPart;
    :cond_2e9
    if-eqz v9, :cond_350

    .line 2417
    :try_start_2eb
    const-string v25, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v8, v1}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2424
    :goto_2fa
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    move-object/from16 v25, v0

    const-string v26, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->tail(Ljava/util/logging/Formatter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->appendSubject(Lkorex/mail/Message;Ljava/lang/String;)V

    .line 2426
    new-instance v20, Lkorex/mail/internet/MimeMultipart;

    invoke-direct/range {v20 .. v20}, Lkorex/mail/internet/MimeMultipart;-><init>()V

    .line 2427
    .local v20, "multipart":Lkorex/mail/internet/MimeMultipart;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2428
    .local v5, "altType":Ljava/lang/String;
    if-nez v5, :cond_35a

    .end local v11    # "contentType":Ljava/lang/String;
    :goto_32c
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v9, v11}, Lcom/sun/mail/util/logging/MailHandler;->setContent(Lkorex/mail/internet/MimeBodyPart;Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 2429
    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lkorex/mail/internet/MimeMultipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 2431
    const/4 v15, 0x0

    :goto_337
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v15, v0, :cond_35c

    .line 2432
    aget-object v25, v22, v15

    if-eqz v25, :cond_34d

    .line 2433
    aget-object v25, v22, v15

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lkorex/mail/internet/MimeMultipart;->addBodyPart(Lkorex/mail/BodyPart;)V

    .line 2431
    :cond_34d
    add-int/lit8 v15, v15, 0x1

    goto :goto_337

    .line 2421
    .end local v5    # "altType":Ljava/lang/String;
    .end local v20    # "multipart":Lkorex/mail/internet/MimeMultipart;
    .restart local v11    # "contentType":Ljava/lang/String;
    :cond_350
    new-instance v9, Ljava/lang/StringBuilder;

    .end local v9    # "buf":Ljava/lang/StringBuilder;
    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .restart local v9    # "buf":Ljava/lang/StringBuilder;
    goto :goto_2fa

    .restart local v5    # "altType":Ljava/lang/String;
    .restart local v20    # "multipart":Lkorex/mail/internet/MimeMultipart;
    :cond_35a
    move-object v11, v5

    .line 2428
    goto :goto_32c

    .line 2437
    .end local v11    # "contentType":Ljava/lang/String;
    :cond_35c
    invoke-virtual/range {v19 .. v20}, Lkorex/mail/internet/MimeMessage;->setContent(Lkorex/mail/Multipart;)V
    :try_end_35f
    .catch Ljava/lang/RuntimeException; {:try_start_2eb .. :try_end_35f} :catch_1f7
    .catch Ljava/lang/Exception; {:try_start_2eb .. :try_end_35f} :catch_2c3
    .catchall {:try_start_2eb .. :try_end_35f} :catchall_374

    .line 2444
    const/16 v25, 0x0

    :try_start_361
    move/from16 v0, v25

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    .line 2445
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v25, v0

    if-lez v25, :cond_13

    .line 2446
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->reset()V

    goto/16 :goto_13

    .line 2444
    .end local v5    # "altType":Ljava/lang/String;
    .end local v6    # "body":Lkorex/mail/internet/MimeBodyPart;
    .end local v7    # "bodyFilter":Ljava/util/logging/Filter;
    .end local v8    # "bodyFormat":Ljava/util/logging/Formatter;
    .end local v9    # "buf":Ljava/lang/StringBuilder;
    .end local v10    # "buffers":[Ljava/lang/StringBuilder;
    .end local v15    # "i":I
    .end local v16    # "ix":I
    .end local v17    # "lastLocale":Ljava/util/Locale;
    .end local v19    # "msg":Lkorex/mail/internet/MimeMessage;
    .end local v20    # "multipart":Lkorex/mail/internet/MimeMultipart;
    .end local v22    # "parts":[Lkorex/mail/internet/MimeBodyPart;
    :catchall_374
    move-exception v25

    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    .line 2445
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    move/from16 v26, v0

    if-lez v26, :cond_388

    .line 2446
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/util/logging/MailHandler;->reset()V

    :cond_388
    throw v25
    :try_end_389
    .catchall {:try_start_361 .. :try_end_389} :catchall_2e6
.end method


# virtual methods
.method final checkAccess()V
    .registers 2

    .prologue
    .line 1258
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->sealed:Z

    if-eqz v0, :cond_b

    .line 1259
    invoke-static {}, Lcom/sun/mail/util/logging/LogManagerProperties;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/logging/LogManager;->checkAccess()V

    .line 1261
    :cond_b
    return-void
.end method

.method public close()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 719
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 722
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->getAndSetContextClassLoader()Ljava/lang/Object;

    move-result-object v0

    .line 724
    .local v0, "ccl":Ljava/lang/Object;
    const/4 v1, 0x0

    .line 725
    .local v1, "msg":Lkorex/mail/Message;
    :try_start_9
    monitor-enter p0
    :try_end_a
    .catchall {:try_start_9 .. :try_end_a} :catchall_58

    .line 727
    const/4 v2, 0x3

    :try_start_b
    invoke-direct {p0, v2}, Lcom/sun/mail/util/logging/MailHandler;->writeLogRecords(I)Lkorex/mail/Message;
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_37

    move-result-object v1

    .line 729
    :try_start_f
    sget-object v2, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-super {p0, v2}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V

    .line 735
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-lez v2, :cond_1d

    .line 736
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    neg-int v2, v2

    iput v2, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    .line 740
    :cond_1d
    iget v2, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    if-nez v2, :cond_2b

    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v2, v2

    if-eq v2, v4, :cond_2b

    .line 741
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/logging/LogRecord;

    iput-object v2, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    .line 744
    :cond_2b
    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_f .. :try_end_2c} :catchall_55

    .line 746
    if-eqz v1, :cond_33

    .line 747
    const/4 v2, 0x0

    const/4 v3, 0x3

    :try_start_30
    invoke-direct {p0, v1, v2, v3}, Lcom/sun/mail/util/logging/MailHandler;->send(Lkorex/mail/Message;ZI)V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_58

    .line 750
    :cond_33
    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setContextClassLoader(Ljava/lang/Object;)V

    .line 752
    return-void

    .line 729
    :catchall_37
    move-exception v2

    :try_start_38
    sget-object v3, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    invoke-super {p0, v3}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V

    .line 735
    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-lez v3, :cond_46

    .line 736
    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    neg-int v3, v3

    iput v3, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    .line 740
    :cond_46
    iget v3, p0, Lcom/sun/mail/util/logging/MailHandler;->size:I

    if-nez v3, :cond_54

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    array-length v3, v3

    if-eq v3, v4, :cond_54

    .line 741
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/util/logging/LogRecord;

    iput-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->data:[Ljava/util/logging/LogRecord;

    :cond_54
    throw v2

    .line 744
    :catchall_55
    move-exception v2

    monitor-exit p0
    :try_end_57
    .catchall {:try_start_38 .. :try_end_57} :catchall_55

    :try_start_57
    throw v2
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_58

    .line 750
    :catchall_58
    move-exception v2

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setContextClassLoader(Ljava/lang/Object;)V

    throw v2
.end method

.method final contentTypeOf(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "head"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x19

    .line 1273
    invoke-static {p1}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_43

    .line 1274
    const/16 v1, 0x19

    .line 1275
    .local v1, "MAX_CHARS":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v5, :cond_15

    .line 1276
    const/4 v4, 0x0

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1279
    :cond_15
    :try_start_15
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->getEncodingName()Ljava/lang/String;

    move-result-object v2

    .line 1280
    .local v2, "encoding":Ljava/lang/String;
    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 1281
    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1283
    .local v3, "in":Ljava/io/ByteArrayInputStream;
    sget-boolean v4, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v4, :cond_45

    invoke-virtual {v3}, Ljava/io/ByteArrayInputStream;->markSupported()Z

    move-result v4

    if-nez v4, :cond_45

    new-instance v4, Ljava/lang/AssertionError;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v4
    :try_end_3a
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_3a} :catch_3a

    .line 1285
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v3    # "in":Ljava/io/ByteArrayInputStream;
    :catch_3a
    move-exception v0

    .line 1286
    .local v0, "IOE":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {p0, v4, v0, v5}, Lcom/sun/mail/util/logging/MailHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1289
    .end local v0    # "IOE":Ljava/io/IOException;
    .end local v1    # "MAX_CHARS":I
    :cond_43
    const/4 v4, 0x0

    :goto_44
    return-object v4

    .line 1284
    .restart local v1    # "MAX_CHARS":I
    .restart local v2    # "encoding":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/ByteArrayInputStream;
    :cond_45
    :try_start_45
    invoke-static {v3}, Ljava/net/URLConnection;->guessContentTypeFromStream(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_3a

    move-result-object v4

    goto :goto_44
.end method

.method public flush()V
    .registers 3

    .prologue
    .line 702
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->push(ZI)V

    .line 703
    return-void
.end method

.method public final getAttachmentFilters()[Ljava/util/logging/Filter;
    .registers 2

    .prologue
    .line 983
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->readOnlyAttachmentFilters()[Ljava/util/logging/Filter;

    move-result-object v0

    invoke-virtual {v0}, [Ljava/util/logging/Filter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/util/logging/Filter;

    return-object v0
.end method

.method public final getAttachmentFormatters()[Ljava/util/logging/Formatter;
    .registers 3

    .prologue
    .line 1020
    monitor-enter p0

    .line 1021
    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    .line 1022
    .local v0, "formatters":[Ljava/util/logging/Formatter;
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_b

    .line 1023
    invoke-virtual {v0}, [Ljava/util/logging/Formatter;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/util/logging/Formatter;

    return-object v1

    .line 1022
    .end local v0    # "formatters":[Ljava/util/logging/Formatter;
    :catchall_b
    move-exception v1

    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw v1
.end method

.method public final getAttachmentNames()[Ljava/util/logging/Formatter;
    .registers 3

    .prologue
    .line 1072
    monitor-enter p0

    .line 1073
    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1074
    .local v0, "formatters":[Ljava/util/logging/Formatter;
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_b

    .line 1075
    invoke-virtual {v0}, [Ljava/util/logging/Formatter;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/util/logging/Formatter;

    return-object v1

    .line 1074
    .end local v0    # "formatters":[Ljava/util/logging/Formatter;
    :catchall_b
    move-exception v1

    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw v1
.end method

.method public final declared-synchronized getAuthenticator()Lkorex/mail/Authenticator;
    .registers 2

    .prologue
    .line 877
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 878
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->auth:Lkorex/mail/Authenticator;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object v0

    .line 877
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getCapacity()I
    .registers 3

    .prologue
    .line 866
    monitor-enter p0

    :try_start_1
    sget-boolean v0, Lcom/sun/mail/util/logging/MailHandler;->$assertionsDisabled:Z

    if-nez v0, :cond_1a

    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_f

    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-nez v0, :cond_1a

    :cond_f
    new-instance v0, Ljava/lang/AssertionError;

    iget v1, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_17

    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0

    .line 867
    :cond_1a
    :try_start_1a
    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_17

    move-result v0

    monitor-exit p0

    return v0
.end method

.method public final declared-synchronized getComparator()Ljava/util/Comparator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 840
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final getMailProperties()Ljava/util/Properties;
    .registers 3

    .prologue
    .line 968
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 970
    monitor-enter p0

    .line 971
    :try_start_4
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->mailProps:Ljava/util/Properties;

    .line 972
    .local v0, "props":Ljava/util/Properties;
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_e

    .line 973
    invoke-virtual {v0}, Ljava/util/Properties;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Properties;

    return-object v1

    .line 972
    .end local v0    # "props":Ljava/util/Properties;
    :catchall_e
    move-exception v1

    :try_start_f
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_e

    throw v1
.end method

.method public final declared-synchronized getPushFilter()Ljava/util/logging/Filter;
    .registers 2

    .prologue
    .line 812
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getPushLevel()Ljava/util/logging/Level;
    .registers 2

    .prologue
    .line 781
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getSubject()Ljava/util/logging/Formatter;
    .registers 2

    .prologue
    .line 1179
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isLoggable(Ljava/util/logging/LogRecord;)Z
    .registers 5
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 548
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getLevel()Ljava/util/logging/Level;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    .line 549
    .local v1, "levelValue":I
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/logging/Level;->intValue()I

    move-result v2

    if-lt v2, v1, :cond_16

    sget v2, Lcom/sun/mail/util/logging/MailHandler;->offValue:I

    if-ne v1, v2, :cond_18

    .line 550
    :cond_16
    const/4 v2, 0x0

    .line 558
    :goto_17
    return v2

    .line 553
    :cond_18
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->getFilter()Ljava/util/logging/Filter;

    move-result-object v0

    .line 554
    .local v0, "body":Ljava/util/logging/Filter;
    if-eqz v0, :cond_24

    invoke-interface {v0, p1}, Ljava/util/logging/Filter;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 555
    :cond_24
    const/4 v2, 0x1

    goto :goto_17

    .line 558
    :cond_26
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->isAttachmentLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v2

    goto :goto_17
.end method

.method final isMissingContent(Lkorex/mail/Message;Ljava/lang/Throwable;)Z
    .registers 9
    .param p1, "msg"    # Lkorex/mail/Message;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 1302
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .local v1, "cause":Ljava/lang/Throwable;
    :goto_4
    if-eqz v1, :cond_c

    .line 1303
    move-object p2, v1

    .line 1304
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_4

    .line 1308
    :cond_c
    :try_start_c
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    const/16 v5, 0x400

    invoke-direct {v4, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-virtual {p1, v4}, Lkorex/mail/Message;->writeTo(Ljava/io/OutputStream;)V
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_16} :catch_18
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_16} :catch_1a

    .line 1317
    :cond_16
    const/4 v4, 0x0

    :goto_17
    return v4

    .line 1309
    :catch_18
    move-exception v0

    .line 1310
    .local v0, "RE":Ljava/lang/RuntimeException;
    throw v0

    .line 1311
    .end local v0    # "RE":Ljava/lang/RuntimeException;
    :catch_1a
    move-exception v2

    .line 1312
    .local v2, "noContent":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    .line 1313
    .local v3, "txt":Ljava/lang/String;
    invoke-static {v3}, Lcom/sun/mail/util/logging/MailHandler;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_16

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-ne v4, v5, :cond_16

    .line 1314
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    goto :goto_17
.end method

.method public publish(Ljava/util/logging/LogRecord;)V
    .registers 3
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 582
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->tryMutex()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 584
    :try_start_6
    invoke-virtual {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 585
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    .line 586
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->publish0(Ljava/util/logging/LogRecord;)V
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_16

    .line 589
    :cond_12
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->releaseMutex()V

    .line 594
    :goto_15
    return-void

    .line 589
    :catchall_16
    move-exception v0

    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->releaseMutex()V

    throw v0

    .line 592
    :cond_1b
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->reportUnPublishedError(Ljava/util/logging/LogRecord;)V

    goto :goto_15
.end method

.method public push()V
    .registers 3

    .prologue
    .line 692
    const/4 v0, 0x1

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->push(ZI)V

    .line 693
    return-void
.end method

.method protected reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    .registers 6
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;
    .param p3, "code"    # I

    .prologue
    .line 1247
    if-eqz p1, :cond_23

    .line 1248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v1}, Ljava/util/logging/Level;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0, p2, p3}, Ljava/util/logging/Handler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    .line 1252
    :goto_22
    return-void

    .line 1250
    :cond_23
    const/4 v0, 0x0

    invoke-super {p0, v0, p2, p3}, Ljava/util/logging/Handler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V

    goto :goto_22
.end method

.method public final varargs setAttachmentFilters([Ljava/util/logging/Filter;)V
    .registers 4
    .param p1, "filters"    # [Ljava/util/logging/Filter;

    .prologue
    .line 999
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1000
    array-length v0, p1

    const-class v1, [Ljava/util/logging/Filter;

    invoke-static {p1, v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "filters":[Ljava/util/logging/Filter;
    check-cast p1, [Ljava/util/logging/Filter;

    .line 1001
    .restart local p1    # "filters":[Ljava/util/logging/Filter;
    monitor-enter p0

    .line 1002
    :try_start_d
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v0, v0

    array-length v1, p1

    if-eq v0, v1, :cond_1f

    .line 1003
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v0, v0

    array-length v1, p1

    invoke-static {v0, v1}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(II)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 1010
    :catchall_1c
    move-exception v0

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_d .. :try_end_1e} :catchall_1c

    throw v0

    .line 1006
    :cond_1f
    :try_start_1f
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_29

    .line 1007
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1009
    :cond_29
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFilters:[Ljava/util/logging/Filter;

    .line 1010
    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_1f .. :try_end_2c} :catchall_1c

    .line 1011
    return-void
.end method

.method public final varargs setAttachmentFormatters([Ljava/util/logging/Formatter;)V
    .registers 5
    .param p1, "formatters"    # [Ljava/util/logging/Formatter;

    .prologue
    .line 1039
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1040
    array-length v1, p1

    if-nez v1, :cond_18

    .line 1041
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object p1

    .line 1052
    :cond_a
    monitor-enter p0

    .line 1053
    :try_start_b
    iget-boolean v1, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v1, :cond_36

    .line 1054
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 1060
    :catchall_15
    move-exception v1

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_b .. :try_end_17} :catchall_15

    throw v1

    .line 1043
    :cond_18
    array-length v1, p1

    const-class v2, [Ljava/util/logging/Formatter;

    invoke-static {p1, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "formatters":[Ljava/util/logging/Formatter;
    check-cast p1, [Ljava/util/logging/Formatter;

    .line 1045
    .restart local p1    # "formatters":[Ljava/util/logging/Formatter;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    array-length v1, p1

    if-ge v0, v1, :cond_a

    .line 1046
    aget-object v1, p1, v0

    if-nez v1, :cond_33

    .line 1047
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-static {v0}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1045
    :cond_33
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 1057
    .end local v0    # "i":I
    :cond_36
    :try_start_36
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    .line 1058
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentFilters()Z

    .line 1059
    invoke-direct {p0}, Lcom/sun/mail/util/logging/MailHandler;->fixUpAttachmentNames()Z

    .line 1060
    monitor-exit p0
    :try_end_3f
    .catchall {:try_start_36 .. :try_end_3f} :catchall_15

    .line 1061
    return-void
.end method

.method public final varargs setAttachmentNames([Ljava/lang/String;)V
    .registers 7
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 1094
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1097
    array-length v3, p1

    if-nez v3, :cond_22

    .line 1098
    invoke-static {}, Lcom/sun/mail/util/logging/MailHandler;->emptyFormatterArray()[Ljava/util/logging/Formatter;

    move-result-object v0

    .line 1103
    .local v0, "formatters":[Ljava/util/logging/Formatter;
    :goto_a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    array-length v3, p1

    if-ge v1, v3, :cond_3a

    .line 1104
    aget-object v2, p1, v1

    .line 1105
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_30

    .line 1106
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_26

    .line 1107
    new-instance v3, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v3, v2}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    aput-object v3, v0, v1

    .line 1103
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1100
    .end local v0    # "formatters":[Ljava/util/logging/Formatter;
    .end local v1    # "i":I
    .end local v2    # "name":Ljava/lang/String;
    :cond_22
    array-length v3, p1

    new-array v0, v3, [Ljava/util/logging/Formatter;

    .restart local v0    # "formatters":[Ljava/util/logging/Formatter;
    goto :goto_a

    .line 1109
    .restart local v1    # "i":I
    .restart local v2    # "name":Ljava/lang/String;
    :cond_26
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1112
    :cond_30
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-static {v1}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1116
    .end local v2    # "name":Ljava/lang/String;
    :cond_3a
    monitor-enter p0

    .line 1117
    :try_start_3b
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v3, v3

    array-length v4, p1

    if-eq v3, v4, :cond_4d

    .line 1118
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v3, v3

    array-length v4, p1

    invoke-static {v3, v4}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(II)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 1125
    :catchall_4a
    move-exception v3

    monitor-exit p0
    :try_end_4c
    .catchall {:try_start_3b .. :try_end_4c} :catchall_4a

    throw v3

    .line 1121
    :cond_4d
    :try_start_4d
    iget-boolean v3, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v3, :cond_57

    .line 1122
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 1124
    :cond_57
    iput-object v0, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1125
    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_4d .. :try_end_5a} :catchall_4a

    .line 1126
    return-void
.end method

.method public final varargs setAttachmentNames([Ljava/util/logging/Formatter;)V
    .registers 5
    .param p1, "formatters"    # [Ljava/util/logging/Formatter;

    .prologue
    .line 1150
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1152
    array-length v1, p1

    const-class v2, [Ljava/util/logging/Formatter;

    invoke-static {p1, v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "formatters":[Ljava/util/logging/Formatter;
    check-cast p1, [Ljava/util/logging/Formatter;

    .line 1153
    .restart local p1    # "formatters":[Ljava/util/logging/Formatter;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v1, p1

    if-ge v0, v1, :cond_21

    .line 1154
    aget-object v1, p1, v0

    if-nez v1, :cond_1e

    .line 1155
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-static {v0}, Lcom/sun/mail/util/logging/MailHandler;->atIndexMsg(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1153
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 1159
    :cond_21
    monitor-enter p0

    .line 1160
    :try_start_22
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v1, v1

    array-length v2, p1

    if-eq v1, v2, :cond_34

    .line 1161
    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentFormatters:[Ljava/util/logging/Formatter;

    array-length v1, v1

    array-length v2, p1

    invoke-static {v1, v2}, Lcom/sun/mail/util/logging/MailHandler;->attachmentMismatch(II)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 1169
    :catchall_31
    move-exception v1

    monitor-exit p0
    :try_end_33
    .catchall {:try_start_22 .. :try_end_33} :catchall_31

    throw v1

    .line 1164
    :cond_34
    :try_start_34
    iget-boolean v1, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v1, :cond_3e

    .line 1165
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 1168
    :cond_3e
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->attachmentNames:[Ljava/util/logging/Formatter;

    .line 1169
    monitor-exit p0
    :try_end_41
    .catchall {:try_start_34 .. :try_end_41} :catchall_31

    .line 1170
    return-void
.end method

.method public final setAuthenticator(Lkorex/mail/Authenticator;)V
    .registers 2
    .param p1, "auth"    # Lkorex/mail/Authenticator;

    .prologue
    .line 889
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setAuthenticator0(Lkorex/mail/Authenticator;)V

    .line 890
    return-void
.end method

.method public final varargs setAuthenticator([C)V
    .registers 4
    .param p1, "password"    # [C

    .prologue
    .line 902
    if-nez p1, :cond_9

    .line 903
    const/4 v0, 0x0

    check-cast v0, Lkorex/mail/Authenticator;

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setAuthenticator0(Lkorex/mail/Authenticator;)V

    .line 907
    :goto_8
    return-void

    .line 905
    :cond_9
    new-instance v0, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v0, v1}, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setAuthenticator0(Lkorex/mail/Authenticator;)V

    goto :goto_8
.end method

.method public final declared-synchronized setComparator(Ljava/util/Comparator;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<-",
            "Ljava/util/logging/LogRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 852
    .local p1, "c":Ljava/util/Comparator;, "Ljava/util/Comparator<-Ljava/util/logging/LogRecord;>;"
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 853
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_11

    .line 854
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_e

    .line 852
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0

    .line 856
    :cond_11
    :try_start_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->comparator:Ljava/util/Comparator;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_e

    .line 857
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setLevel(Ljava/util/logging/Level;)V
    .registers 3
    .param p1, "newLevel"    # Ljava/util/logging/Level;

    .prologue
    .line 765
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/sun/mail/util/logging/MailHandler;->capacity:I

    if-lez v0, :cond_a

    .line 766
    invoke-super {p0, p1}, Ljava/util/logging/Handler;->setLevel(Ljava/util/logging/Level;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_12

    .line 773
    :goto_8
    monitor-exit p0

    return-void

    .line 768
    :cond_a
    if-nez p1, :cond_15

    .line 769
    :try_start_c
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
    :try_end_12
    .catchall {:try_start_c .. :try_end_12} :catchall_12

    .line 765
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0

    .line 771
    :cond_15
    :try_start_15
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_12

    goto :goto_8
.end method

.method public final setMailProperties(Ljava/util/Properties;)V
    .registers 2
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 939
    invoke-direct {p0, p1}, Lcom/sun/mail/util/logging/MailHandler;->setMailProperties0(Ljava/util/Properties;)V

    .line 940
    return-void
.end method

.method public final declared-synchronized setPushFilter(Ljava/util/logging/Filter;)V
    .registers 3
    .param p1, "filter"    # Ljava/util/logging/Filter;

    .prologue
    .line 827
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 828
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_11

    .line 829
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_e

    .line 827
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0

    .line 831
    :cond_11
    :try_start_11
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->pushFilter:Ljava/util/logging/Filter;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_e

    .line 832
    monitor-exit p0

    return-void
.end method

.method public final declared-synchronized setPushLevel(Ljava/util/logging/Level;)V
    .registers 3
    .param p1, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 796
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 797
    if-nez p1, :cond_f

    .line 798
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_c

    .line 796
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0

    .line 801
    :cond_f
    :try_start_f
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_19

    .line 802
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 804
    :cond_19
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->pushLevel:Ljava/util/logging/Level;
    :try_end_1b
    .catchall {:try_start_f .. :try_end_1b} :catchall_c

    .line 805
    monitor-exit p0

    return-void
.end method

.method public final setSubject(Ljava/lang/String;)V
    .registers 3
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 1194
    if-eqz p1, :cond_b

    .line 1195
    new-instance v0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    invoke-direct {v0, p1}, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/sun/mail/util/logging/MailHandler;->setSubject(Ljava/util/logging/Formatter;)V

    .line 1200
    return-void

    .line 1197
    :cond_b
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1198
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public final setSubject(Ljava/util/logging/Formatter;)V
    .registers 3
    .param p1, "format"    # Ljava/util/logging/Formatter;

    .prologue
    .line 1222
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler;->checkAccess()V

    .line 1223
    if-nez p1, :cond_b

    .line 1224
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 1227
    :cond_b
    monitor-enter p0

    .line 1228
    :try_start_c
    iget-boolean v0, p0, Lcom/sun/mail/util/logging/MailHandler;->isWriting:Z

    if-eqz v0, :cond_19

    .line 1229
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1232
    :catchall_16
    move-exception v0

    monitor-exit p0
    :try_end_18
    .catchall {:try_start_c .. :try_end_18} :catchall_16

    throw v0

    .line 1231
    :cond_19
    :try_start_19
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler;->subjectFormatter:Ljava/util/logging/Formatter;

    .line 1232
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_16

    .line 1233
    return-void
.end method
