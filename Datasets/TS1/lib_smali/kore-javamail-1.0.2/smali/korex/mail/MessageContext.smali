.class public Lkorex/mail/MessageContext;
.super Ljava/lang/Object;
.source "MessageContext.java"


# instance fields
.field private part:Lkorex/mail/Part;


# direct methods
.method public constructor <init>(Lkorex/mail/Part;)V
    .registers 2
    .param p1, "part"    # Lkorex/mail/Part;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lkorex/mail/MessageContext;->part:Lkorex/mail/Part;

    .line 67
    return-void
.end method

.method private static getMessage(Lkorex/mail/Part;)Lkorex/mail/Message;
    .registers 5
    .param p0, "p"    # Lkorex/mail/Part;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 103
    :goto_1
    if-eqz p0, :cond_1a

    .line 104
    instance-of v3, p0, Lkorex/mail/Message;

    if-eqz v3, :cond_a

    .line 105
    check-cast p0, Lkorex/mail/Message;

    .line 112
    .end local p0    # "p":Lkorex/mail/Part;
    .local v0, "bp":Lkorex/mail/BodyPart;
    .local v1, "mp":Lkorex/mail/Multipart;
    :goto_9
    return-object p0

    .end local v0    # "bp":Lkorex/mail/BodyPart;
    .end local v1    # "mp":Lkorex/mail/Multipart;
    .restart local p0    # "p":Lkorex/mail/Part;
    :cond_a
    move-object v0, p0

    .line 106
    check-cast v0, Lkorex/mail/BodyPart;

    .line 107
    .restart local v0    # "bp":Lkorex/mail/BodyPart;
    invoke-virtual {v0}, Lkorex/mail/BodyPart;->getParent()Lkorex/mail/Multipart;

    move-result-object v1

    .line 108
    .restart local v1    # "mp":Lkorex/mail/Multipart;
    if-nez v1, :cond_15

    move-object p0, v2

    .line 109
    goto :goto_9

    .line 110
    :cond_15
    invoke-virtual {v1}, Lkorex/mail/Multipart;->getParent()Lkorex/mail/Part;

    move-result-object p0

    .line 111
    goto :goto_1

    .end local v0    # "bp":Lkorex/mail/BodyPart;
    .end local v1    # "mp":Lkorex/mail/Multipart;
    :cond_1a
    move-object p0, v2

    .line 112
    goto :goto_9
.end method


# virtual methods
.method public getMessage()Lkorex/mail/Message;
    .registers 3

    .prologue
    .line 87
    :try_start_0
    iget-object v1, p0, Lkorex/mail/MessageContext;->part:Lkorex/mail/Part;

    invoke-static {v1}, Lkorex/mail/MessageContext;->getMessage(Lkorex/mail/Part;)Lkorex/mail/Message;
    :try_end_5
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 89
    :goto_6
    return-object v1

    .line 88
    :catch_7
    move-exception v0

    .line 89
    .local v0, "ex":Lkorex/mail/MessagingException;
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getPart()Lkorex/mail/Part;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lkorex/mail/MessageContext;->part:Lkorex/mail/Part;

    return-object v0
.end method

.method public getSession()Lkorex/mail/Session;
    .registers 3

    .prologue
    .line 121
    invoke-virtual {p0}, Lkorex/mail/MessageContext;->getMessage()Lkorex/mail/Message;

    move-result-object v0

    .line 122
    .local v0, "msg":Lkorex/mail/Message;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lkorex/mail/Message;->getSession()Lkorex/mail/Session;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method
