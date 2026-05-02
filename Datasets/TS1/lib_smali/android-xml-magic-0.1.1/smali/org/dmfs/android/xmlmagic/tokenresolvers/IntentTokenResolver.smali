.class public Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# instance fields
.field private final mIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 7

    const/4 v2, 0x0

    if-nez p1, :cond_5

    move-object v0, v2

    :goto_4
    return-object v0

    :cond_5
    const-string v0, "@intent."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a0

    const-string v0, "@intent.data"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_1c
    const-string v0, "@intent.data.scheme"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_2b
    const-string v0, "@intent.action"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_3a
    const-string v0, "@intent.type"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_49
    const-string v0, "@intent.extra:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a0

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/IntentTokenResolver;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_70

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6e

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_6e
    move-object v0, v2

    goto :goto_4

    :cond_70
    const/16 v3, 0x2e

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-lez v3, :cond_a0

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_85

    move-object v0, v2

    goto :goto_4

    :cond_85
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_70

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_9d

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    :cond_9d
    move-object v0, v2

    goto/16 :goto_4

    :cond_a0
    move-object v0, v2

    goto/16 :goto_4
.end method
