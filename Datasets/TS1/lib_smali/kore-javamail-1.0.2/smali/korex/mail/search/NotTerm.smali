.class public final Lkorex/mail/search/NotTerm;
.super Lkorex/mail/search/SearchTerm;
.source "NotTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x63420cc8aadc1008L


# instance fields
.field private term:Lkorex/mail/search/SearchTerm;


# direct methods
.method public constructor <init>(Lkorex/mail/search/SearchTerm;)V
    .registers 2
    .param p1, "t"    # Lkorex/mail/search/SearchTerm;

    .prologue
    .line 61
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 62
    iput-object p1, p0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    .line 63
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 83
    instance-of v1, p1, Lkorex/mail/search/NotTerm;

    if-nez v1, :cond_6

    .line 84
    const/4 v1, 0x0

    .line 86
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 85
    check-cast v0, Lkorex/mail/search/NotTerm;

    .line 86
    .local v0, "nt":Lkorex/mail/search/NotTerm;
    iget-object v1, v0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    iget-object v2, p0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_5
.end method

.method public getTerm()Lkorex/mail/search/SearchTerm;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 3
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 76
    iget-object v0, p0, Lkorex/mail/search/NotTerm;->term:Lkorex/mail/search/SearchTerm;

    invoke-virtual {v0, p1}, Lkorex/mail/search/SearchTerm;->match(Lkorex/mail/Message;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
