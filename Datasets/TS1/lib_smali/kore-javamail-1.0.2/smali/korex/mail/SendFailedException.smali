.class public Lkorex/mail/SendFailedException;
.super Lkorex/mail/MessagingException;
.source "SendFailedException.java"


# static fields
.field private static final serialVersionUID:J = -0x599dc2cbe43ae131L


# instance fields
.field protected transient invalid:[Lkorex/mail/Address;

.field protected transient validSent:[Lkorex/mail/Address;

.field protected transient validUnsent:[Lkorex/mail/Address;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 69
    invoke-direct {p0}, Lkorex/mail/MessagingException;-><init>()V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;[Lkorex/mail/Address;[Lkorex/mail/Address;[Lkorex/mail/Address;)V
    .registers 6
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ex"    # Ljava/lang/Exception;
    .param p3, "validSent"    # [Lkorex/mail/Address;
    .param p4, "validUnsent"    # [Lkorex/mail/Address;
    .param p5, "invalid"    # [Lkorex/mail/Address;

    .prologue
    .line 108
    invoke-direct {p0, p1, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 109
    iput-object p3, p0, Lkorex/mail/SendFailedException;->validSent:[Lkorex/mail/Address;

    .line 110
    iput-object p4, p0, Lkorex/mail/SendFailedException;->validUnsent:[Lkorex/mail/Address;

    .line 111
    iput-object p5, p0, Lkorex/mail/SendFailedException;->invalid:[Lkorex/mail/Address;

    .line 112
    return-void
.end method


# virtual methods
.method public getInvalidAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lkorex/mail/SendFailedException;->invalid:[Lkorex/mail/Address;

    return-object v0
.end method

.method public getValidSentAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lkorex/mail/SendFailedException;->validSent:[Lkorex/mail/Address;

    return-object v0
.end method

.method public getValidUnsentAddresses()[Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lkorex/mail/SendFailedException;->validUnsent:[Lkorex/mail/Address;

    return-object v0
.end method
