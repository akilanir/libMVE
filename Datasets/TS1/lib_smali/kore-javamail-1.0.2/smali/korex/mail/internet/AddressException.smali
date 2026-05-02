.class public Lkorex/mail/internet/AddressException;
.super Lkorex/mail/internet/ParseException;
.source "AddressException.java"


# static fields
.field private static final serialVersionUID:J = 0x7ec48f3eab5368f0L


# instance fields
.field protected pos:I

.field protected ref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Lkorex/mail/internet/ParseException;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/internet/AddressException;->pos:I

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/internet/AddressException;->pos:I

    .line 80
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "ref"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/internet/AddressException;->pos:I

    .line 91
    iput-object p2, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "ref"    # Ljava/lang/String;
    .param p3, "pos"    # I

    .prologue
    .line 103
    invoke-direct {p0, p1}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 63
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/internet/AddressException;->pos:I

    .line 104
    iput-object p2, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    .line 105
    iput p3, p0, Lkorex/mail/internet/AddressException;->pos:I

    .line 106
    return-void
.end method


# virtual methods
.method public getPos()I
    .registers 2

    .prologue
    .line 125
    iget v0, p0, Lkorex/mail/internet/AddressException;->pos:I

    return v0
.end method

.method public getRef()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 129
    invoke-super {p0}, Lkorex/mail/internet/ParseException;->toString()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    if-nez v1, :cond_a

    move-object v1, v0

    .line 135
    :goto_9
    return-object v1

    .line 132
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in string ``"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/internet/AddressException;->ref:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    iget v1, p0, Lkorex/mail/internet/AddressException;->pos:I

    if-gez v1, :cond_2f

    move-object v1, v0

    .line 134
    goto :goto_9

    .line 135
    :cond_2f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " at position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lkorex/mail/internet/AddressException;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method
