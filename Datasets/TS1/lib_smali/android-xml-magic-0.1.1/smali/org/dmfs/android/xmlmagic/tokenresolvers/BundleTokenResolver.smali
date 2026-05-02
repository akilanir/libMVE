.class public Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# instance fields
.field private final mBundle:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;->mBundle:Landroid/os/Bundle;

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
    const-string v0, "@bundle:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5c

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_28
    move-object v0, v2

    goto :goto_4

    :cond_2a
    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;->mBundle:Landroid/os/Bundle;

    :cond_2c
    const/16 v3, 0x2e

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-lez v3, :cond_5c

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_41

    move-object v0, v2

    goto :goto_4

    :cond_41
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/BundleTokenResolver;->mBundle:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5a

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_5a
    move-object v0, v2

    goto :goto_4

    :cond_5c
    move-object v0, v2

    goto :goto_4
.end method
