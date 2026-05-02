.class public Lkorex/mail/Message$RecipientType;
.super Ljava/lang/Object;
.source "Message.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecipientType"
.end annotation


# static fields
.field public static final BCC:Lkorex/mail/Message$RecipientType;

.field public static final CC:Lkorex/mail/Message$RecipientType;

.field public static final TO:Lkorex/mail/Message$RecipientType;

.field private static final serialVersionUID:J = -0x67cd8ef7b0c9bfa8L


# instance fields
.field protected type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 231
    new-instance v0, Lkorex/mail/Message$RecipientType;

    const-string v1, "To"

    invoke-direct {v0, v1}, Lkorex/mail/Message$RecipientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    .line 235
    new-instance v0, Lkorex/mail/Message$RecipientType;

    const-string v1, "Cc"

    invoke-direct {v0, v1}, Lkorex/mail/Message$RecipientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    .line 239
    new-instance v0, Lkorex/mail/Message$RecipientType;

    const-string v1, "Bcc"

    invoke-direct {v0, v1}, Lkorex/mail/Message$RecipientType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 257
    iput-object p1, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    .line 258
    return-void
.end method


# virtual methods
.method protected readResolve()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 271
    iget-object v0, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    const-string v1, "To"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 272
    sget-object v0, Lkorex/mail/Message$RecipientType;->TO:Lkorex/mail/Message$RecipientType;

    .line 276
    :goto_c
    return-object v0

    .line 273
    :cond_d
    iget-object v0, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    const-string v1, "Cc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 274
    sget-object v0, Lkorex/mail/Message$RecipientType;->CC:Lkorex/mail/Message$RecipientType;

    goto :goto_c

    .line 275
    :cond_1a
    iget-object v0, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    const-string v1, "Bcc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 276
    sget-object v0, Lkorex/mail/Message$RecipientType;->BCC:Lkorex/mail/Message$RecipientType;

    goto :goto_c

    .line 278
    :cond_27
    new-instance v0, Ljava/io/InvalidObjectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempt to resolve unknown RecipientType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 283
    iget-object v0, p0, Lkorex/mail/Message$RecipientType;->type:Ljava/lang/String;

    return-object v0
.end method
