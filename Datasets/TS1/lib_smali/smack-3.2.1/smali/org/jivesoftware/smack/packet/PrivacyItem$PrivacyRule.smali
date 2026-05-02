.class public Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
.super Ljava/lang/Object;
.source "PrivacyItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/packet/PrivacyItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrivacyRule"
.end annotation


# static fields
.field public static final SUBSCRIPTION_BOTH:Ljava/lang/String; = "both"

.field public static final SUBSCRIPTION_FROM:Ljava/lang/String; = "from"

.field public static final SUBSCRIPTION_NONE:Ljava/lang/String; = "none"

.field public static final SUBSCRIPTION_TO:Ljava/lang/String; = "to"


# instance fields
.field private type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 325
    if-nez p0, :cond_4

    .line 326
    const/4 v0, 0x0

    .line 330
    :goto_3
    return-object v0

    .line 328
    :cond_4
    new-instance v0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;-><init>()V

    .line 329
    .local v0, "rule":Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/packet/PrivacyItem$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->setType(Lorg/jivesoftware/smack/packet/PrivacyItem$Type;)V

    goto :goto_3
.end method

.method private setSuscriptionValue(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 395
    if-nez p1, :cond_2

    .line 398
    :cond_2
    const-string v1, "both"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 399
    const-string v0, "both"

    .line 414
    .local v0, "setValue":Ljava/lang/String;
    :goto_c
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    .line 415
    return-void

    .line 401
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_f
    const-string v1, "to"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 402
    const-string v0, "to"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_c

    .line 404
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_1a
    const-string v1, "from"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 405
    const-string v0, "from"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_c

    .line 407
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_25
    const-string v1, "none"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 408
    const-string v0, "none"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_c

    .line 412
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_30
    const/4 v0, 0x0

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_c
.end method

.method private setType(Lorg/jivesoftware/smack/packet/PrivacyItem$Type;)V
    .registers 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    .prologue
    .line 349
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    .line 350
    return-void
.end method


# virtual methods
.method public getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isSuscription()Z
    .registers 3

    .prologue
    .line 423
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smack/packet/PrivacyItem$Type;->subscription:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected setValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 379
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->isSuscription()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 380
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->setSuscriptionValue(Ljava/lang/String;)V

    .line 384
    :goto_9
    return-void

    .line 382
    :cond_a
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    goto :goto_9
.end method
