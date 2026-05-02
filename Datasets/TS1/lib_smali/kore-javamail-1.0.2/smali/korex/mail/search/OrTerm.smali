.class public final Lkorex/mail/search/OrTerm;
.super Lkorex/mail/search/SearchTerm;
.source "OrTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x4aab7f3a24a275d8L


# instance fields
.field private terms:[Lkorex/mail/search/SearchTerm;


# direct methods
.method public constructor <init>(Lkorex/mail/search/SearchTerm;Lkorex/mail/search/SearchTerm;)V
    .registers 5
    .param p1, "t1"    # Lkorex/mail/search/SearchTerm;
    .param p2, "t2"    # Lkorex/mail/search/SearchTerm;

    .prologue
    .line 69
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 70
    const/4 v0, 0x2

    new-array v0, v0, [Lkorex/mail/search/SearchTerm;

    iput-object v0, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    .line 71
    iget-object v0, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 72
    iget-object v0, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 73
    return-void
.end method

.method public constructor <init>([Lkorex/mail/search/SearchTerm;)V
    .registers 5
    .param p1, "t"    # [Lkorex/mail/search/SearchTerm;

    .prologue
    .line 80
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 81
    array-length v1, p1

    new-array v1, v1, [Lkorex/mail/search/SearchTerm;

    iput-object v1, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    .line 82
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p1

    if-ge v0, v1, :cond_15

    .line 83
    iget-object v1, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    aget-object v2, p1, v0

    aput-object v2, v1, v0

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 84
    :cond_15
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 117
    instance-of v3, p1, Lkorex/mail/search/OrTerm;

    if-nez v3, :cond_6

    .line 125
    :cond_5
    :goto_5
    return v2

    :cond_6
    move-object v1, p1

    .line 119
    check-cast v1, Lkorex/mail/search/OrTerm;

    .line 120
    .local v1, "ot":Lkorex/mail/search/OrTerm;
    iget-object v3, v1, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    array-length v3, v3

    iget-object v4, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    array-length v4, v4

    if-ne v3, v4, :cond_5

    .line 122
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    iget-object v3, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    array-length v3, v3

    if-ge v0, v3, :cond_28

    .line 123
    iget-object v3, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    aget-object v3, v3, v0

    iget-object v4, v1, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 122
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 125
    :cond_28
    const/4 v2, 0x1

    goto :goto_5
.end method

.method public getTerms()[Lkorex/mail/search/SearchTerm;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    invoke-virtual {v0}, [Lkorex/mail/search/SearchTerm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkorex/mail/search/SearchTerm;

    check-cast v0, [Lkorex/mail/search/SearchTerm;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 132
    const/4 v0, 0x0

    .line 133
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    array-length v2, v2

    if-ge v1, v2, :cond_13

    .line 134
    iget-object v2, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 133
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 135
    :cond_13
    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 4
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 108
    iget-object v1, p0, Lkorex/mail/search/OrTerm;->terms:[Lkorex/mail/search/SearchTerm;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lkorex/mail/search/SearchTerm;->match(Lkorex/mail/Message;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 109
    const/4 v1, 0x1

    .line 110
    :goto_11
    return v1

    .line 107
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 110
    :cond_15
    const/4 v1, 0x0

    goto :goto_11
.end method
