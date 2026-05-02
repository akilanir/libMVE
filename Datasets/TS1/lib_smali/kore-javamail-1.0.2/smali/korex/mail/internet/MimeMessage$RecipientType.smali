.class public Lkorex/mail/internet/MimeMessage$RecipientType;
.super Lkorex/mail/Message$RecipientType;
.source "MimeMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/MimeMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecipientType"
.end annotation


# static fields
.field public static final NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

.field private static final serialVersionUID:J = -0x4be3456bc4421197L


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 520
    new-instance v0, Lkorex/mail/internet/MimeMessage$RecipientType;

    const-string v1, "Newsgroups"

    invoke-direct {v0, v1}, Lkorex/mail/internet/MimeMessage$RecipientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 523
    invoke-direct {p0, p1}, Lkorex/mail/Message$RecipientType;-><init>(Ljava/lang/String;)V

    .line 524
    return-void
.end method


# virtual methods
.method protected readResolve()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 527
    iget-object v0, p0, Lkorex/mail/internet/MimeMessage$RecipientType;->type:Ljava/lang/String;

    const-string v1, "Newsgroups"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 528
    sget-object v0, Lkorex/mail/internet/MimeMessage$RecipientType;->NEWSGROUPS:Lkorex/mail/internet/MimeMessage$RecipientType;

    .line 530
    :goto_c
    return-object v0

    :cond_d
    invoke-super {p0}, Lkorex/mail/Message$RecipientType;->readResolve()Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method
