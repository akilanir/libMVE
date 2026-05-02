.class public Lkorex/mail/FetchProfile;
.super Ljava/lang/Object;
.source "FetchProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/FetchProfile$Item;
    }
.end annotation


# instance fields
.field private headers:Ljava/util/Vector;

.field private specials:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    .line 169
    iput-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    .line 170
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 3
    .param p1, "headerName"    # Ljava/lang/String;

    .prologue
    .line 194
    iget-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    if-nez v0, :cond_b

    .line 195
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    .line 196
    :cond_b
    iget-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 197
    return-void
.end method

.method public add(Lkorex/mail/FetchProfile$Item;)V
    .registers 3
    .param p1, "item"    # Lkorex/mail/FetchProfile$Item;

    .prologue
    .line 182
    iget-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    if-nez v0, :cond_b

    .line 183
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    .line 184
    :cond_b
    iget-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 185
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .registers 3
    .param p1, "headerName"    # Ljava/lang/String;

    .prologue
    .line 216
    iget-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public contains(Lkorex/mail/FetchProfile$Item;)Z
    .registers 3
    .param p1, "item"    # Lkorex/mail/FetchProfile$Item;

    .prologue
    .line 206
    iget-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getHeaderNames()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 239
    iget-object v1, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    if-nez v1, :cond_8

    .line 240
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/lang/String;

    .line 244
    :goto_7
    return-object v0

    .line 242
    :cond_8
    iget-object v1, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 243
    .local v0, "s":[Ljava/lang/String;
    iget-object v1, p0, Lkorex/mail/FetchProfile;->headers:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_7
.end method

.method public getItems()[Lkorex/mail/FetchProfile$Item;
    .registers 3

    .prologue
    .line 225
    iget-object v1, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    if-nez v1, :cond_8

    .line 226
    const/4 v1, 0x0

    new-array v0, v1, [Lkorex/mail/FetchProfile$Item;

    .line 230
    :goto_7
    return-object v0

    .line 228
    :cond_8
    iget-object v1, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lkorex/mail/FetchProfile$Item;

    .line 229
    .local v0, "s":[Lkorex/mail/FetchProfile$Item;
    iget-object v1, p0, Lkorex/mail/FetchProfile;->specials:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_7
.end method
