.class public Lkorex/mail/Flags;
.super Ljava/lang/Object;
.source "Flags.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/Flags$Flag;
    }
.end annotation


# static fields
.field private static final ANSWERED_BIT:I = 0x1

.field private static final DELETED_BIT:I = 0x2

.field private static final DRAFT_BIT:I = 0x4

.field private static final FLAGGED_BIT:I = 0x8

.field private static final RECENT_BIT:I = 0x10

.field private static final SEEN_BIT:I = 0x20

.field private static final USER_BIT:I = -0x80000000

.field private static final serialVersionUID:J = 0x56a5b06539097bc4L


# instance fields
.field private system_flags:I

.field private user_flags:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "flag"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 215
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 216
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Flags$Flag;)V
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 206
    iget v0, p0, Lkorex/mail/Flags;->system_flags:I

    # getter for: Lkorex/mail/Flags$Flag;->bit:I
    invoke-static {p1}, Lkorex/mail/Flags$Flag;->access$000(Lkorex/mail/Flags$Flag;)I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 207
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Flags;)V
    .registers 3
    .param p1, "flags"    # Lkorex/mail/Flags;

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 195
    iget v0, p1, Lkorex/mail/Flags;->system_flags:I

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 196
    iget-object v0, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v0, :cond_1b

    .line 197
    iget-object v0, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Hashtable;

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 198
    :cond_1b
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 4
    .param p1, "flag"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v0, :cond_c

    .line 235
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 236
    :cond_c
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    return-void
.end method

.method public add(Lkorex/mail/Flags$Flag;)V
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;

    .prologue
    .line 225
    iget v0, p0, Lkorex/mail/Flags;->system_flags:I

    # getter for: Lkorex/mail/Flags$Flag;->bit:I
    invoke-static {p1}, Lkorex/mail/Flags$Flag;->access$000(Lkorex/mail/Flags$Flag;)I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 226
    return-void
.end method

.method public add(Lkorex/mail/Flags;)V
    .registers 6
    .param p1, "f"    # Lkorex/mail/Flags;

    .prologue
    .line 246
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    iget v3, p1, Lkorex/mail/Flags;->system_flags:I

    or-int/2addr v2, v3

    iput v2, p0, Lkorex/mail/Flags;->system_flags:I

    .line 248
    iget-object v2, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v2, :cond_35

    .line 249
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v2, :cond_17

    .line 250
    new-instance v2, Ljava/util/Hashtable;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/Hashtable;-><init>(I)V

    iput-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 252
    :cond_17
    iget-object v2, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 254
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1d
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 255
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 256
    .local v1, "s":Ljava/lang/String;
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    iget-object v3, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d

    .line 259
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "s":Ljava/lang/String;
    :cond_35
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 450
    const/4 v1, 0x0

    .line 452
    .local v1, "f":Lkorex/mail/Flags;
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lkorex/mail/Flags;

    move-object v1, v0
    :try_end_9
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_9} :catch_18

    .line 456
    :goto_9
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v2, :cond_17

    .line 457
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Hashtable;

    iput-object v2, v1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 458
    :cond_17
    return-object v1

    .line 453
    :catch_18
    move-exception v2

    goto :goto_9
.end method

.method public contains(Ljava/lang/String;)Z
    .registers 4
    .param p1, "flag"    # Ljava/lang/String;

    .prologue
    .line 316
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v0, :cond_6

    .line 317
    const/4 v0, 0x0

    .line 319
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public contains(Lkorex/mail/Flags$Flag;)Z
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;

    .prologue
    .line 306
    iget v0, p0, Lkorex/mail/Flags;->system_flags:I

    # getter for: Lkorex/mail/Flags$Flag;->bit:I
    invoke-static {p1}, Lkorex/mail/Flags$Flag;->access$000(Lkorex/mail/Flags$Flag;)I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public contains(Lkorex/mail/Flags;)Z
    .registers 6
    .param p1, "f"    # Lkorex/mail/Flags;

    .prologue
    const/4 v1, 0x0

    .line 332
    iget v2, p1, Lkorex/mail/Flags;->system_flags:I

    iget v3, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/2addr v2, v3

    iget v3, p1, Lkorex/mail/Flags;->system_flags:I

    if-eq v2, v3, :cond_b

    .line 348
    :cond_a
    :goto_a
    return v1

    .line 336
    :cond_b
    iget-object v2, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v2, :cond_2c

    .line 337
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v2, :cond_a

    .line 339
    iget-object v2, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 341
    .local v0, "e":Ljava/util/Enumeration;
    :cond_19
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 342
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_19

    goto :goto_a

    .line 348
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_2c
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 357
    instance-of v4, p1, Lkorex/mail/Flags;

    if-nez v4, :cond_7

    .line 380
    :cond_6
    :goto_6
    return v2

    :cond_7
    move-object v1, p1

    .line 360
    check-cast v1, Lkorex/mail/Flags;

    .line 363
    .local v1, "f":Lkorex/mail/Flags;
    iget v4, v1, Lkorex/mail/Flags;->system_flags:I

    iget v5, p0, Lkorex/mail/Flags;->system_flags:I

    if-ne v4, v5, :cond_6

    .line 367
    iget-object v4, v1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v4, :cond_1a

    iget-object v4, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v4, :cond_1a

    move v2, v3

    .line 368
    goto :goto_6

    .line 369
    :cond_1a
    iget-object v4, v1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v4, :cond_6

    iget-object v4, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v4, :cond_6

    iget-object v4, v1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    .line 370
    invoke-virtual {v4}, Ljava/util/Hashtable;->size()I

    move-result v4

    iget-object v5, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->size()I

    move-result v5

    if-ne v4, v5, :cond_6

    .line 371
    iget-object v4, v1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 373
    .local v0, "e":Ljava/util/Enumeration;
    :cond_36
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_49

    .line 374
    iget-object v4, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_36

    goto :goto_6

    :cond_49
    move v2, v3

    .line 377
    goto :goto_6
.end method

.method public getSystemFlags()[Lkorex/mail/Flags$Flag;
    .registers 5

    .prologue
    .line 405
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 406
    .local v1, "v":Ljava/util/Vector;
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_10

    .line 407
    sget-object v2, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 408
    :cond_10
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_1b

    .line 409
    sget-object v2, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 410
    :cond_1b
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x4

    if-eqz v2, :cond_26

    .line 411
    sget-object v2, Lkorex/mail/Flags$Flag;->DRAFT:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 412
    :cond_26
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_31

    .line 413
    sget-object v2, Lkorex/mail/Flags$Flag;->FLAGGED:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 414
    :cond_31
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_3c

    .line 415
    sget-object v2, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 416
    :cond_3c
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    and-int/lit8 v2, v2, 0x20

    if-eqz v2, :cond_47

    .line 417
    sget-object v2, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 418
    :cond_47
    iget v2, p0, Lkorex/mail/Flags;->system_flags:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_53

    .line 419
    sget-object v2, Lkorex/mail/Flags$Flag;->USER:Lkorex/mail/Flags$Flag;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 421
    :cond_53
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v0, v2, [Lkorex/mail/Flags$Flag;

    .line 422
    .local v0, "f":[Lkorex/mail/Flags$Flag;
    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 423
    return-object v0
.end method

.method public getUserFlags()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 433
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 434
    .local v2, "v":Ljava/util/Vector;
    iget-object v3, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v3, :cond_1d

    .line 435
    iget-object v3, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 437
    .local v0, "e":Ljava/util/Enumeration;
    :goto_f
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 438
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_f

    .line 441
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_1d
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v1, v3, [Ljava/lang/String;

    .line 442
    .local v1, "f":[Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 443
    return-object v1
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 389
    iget v1, p0, Lkorex/mail/Flags;->system_flags:I

    .line 390
    .local v1, "hash":I
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v2, :cond_1e

    .line 391
    iget-object v2, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 392
    .local v0, "e":Ljava/util/Enumeration;
    :goto_c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 393
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_c

    .line 395
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_1e
    return v1
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "flag"    # Ljava/lang/String;

    .prologue
    .line 276
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v0, :cond_f

    .line 277
    iget-object v0, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    :cond_f
    return-void
.end method

.method public remove(Lkorex/mail/Flags$Flag;)V
    .registers 4
    .param p1, "flag"    # Lkorex/mail/Flags$Flag;

    .prologue
    .line 267
    iget v0, p0, Lkorex/mail/Flags;->system_flags:I

    # getter for: Lkorex/mail/Flags$Flag;->bit:I
    invoke-static {p1}, Lkorex/mail/Flags$Flag;->access$000(Lkorex/mail/Flags$Flag;)I

    move-result v1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lkorex/mail/Flags;->system_flags:I

    .line 268
    return-void
.end method

.method public remove(Lkorex/mail/Flags;)V
    .registers 5
    .param p1, "f"    # Lkorex/mail/Flags;

    .prologue
    .line 287
    iget v1, p0, Lkorex/mail/Flags;->system_flags:I

    iget v2, p1, Lkorex/mail/Flags;->system_flags:I

    xor-int/lit8 v2, v2, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lkorex/mail/Flags;->system_flags:I

    .line 289
    iget-object v1, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-eqz v1, :cond_11

    .line 290
    iget-object v1, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    if-nez v1, :cond_12

    .line 297
    :cond_11
    return-void

    .line 293
    :cond_12
    iget-object v1, p1, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 294
    .local v0, "e":Ljava/util/Enumeration;
    :goto_18
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 295
    iget-object v1, p0, Lkorex/mail/Flags;->user_flags:Ljava/util/Hashtable;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18
.end method
