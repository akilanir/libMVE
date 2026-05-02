.class public Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mResolvers:[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p1, :cond_6

    move-object v0, v1

    :cond_5
    :goto_5
    return-object v0

    :cond_6
    iget-object v2, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mResolvers:[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    if-eqz v2, :cond_21

    iget-object v2, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mResolvers:[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    array-length v2, v2

    if-lez v2, :cond_21

    iget-object v3, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mResolvers:[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    array-length v4, v3

    move v2, v0

    :goto_13
    if-ge v2, v4, :cond_21

    aget-object v0, v3, v2

    invoke-interface {v0, p1}, Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;->resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    if-nez v0, :cond_5

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_13

    :cond_21
    const-string v0, "@android."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_64

    const-string v0, "@android.model"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    goto :goto_5

    :cond_34
    const-string v0, "@android.sdk"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_43
    const-string v0, "@android.release"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4e

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    goto :goto_5

    :cond_4e
    const-string v0, "@android.manufacturer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    goto :goto_5

    :cond_59
    const-string v0, "@android.product"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10c

    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    goto :goto_5

    :cond_64
    const-string v0, "@locale."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8f

    const-string v0, "@locale.lang"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_7d
    const-string v0, "@locale.country"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10c

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_8f
    const-string v0, "@app."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e6

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :try_start_a4
    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    const-string v4, "@app.package"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "@app.title"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ca

    iget-object v3, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    :cond_ca
    const-string v0, "@app.version"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d6

    iget-object v0, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    goto/16 :goto_5

    :cond_d6
    const-string v0, "@app.version_code"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10c

    iget v0, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;
    :try_end_e3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a4 .. :try_end_e3} :catch_10b

    move-result-object v0

    goto/16 :goto_5

    :cond_e6
    const-string v0, "@string/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10c

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_10c

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto/16 :goto_5

    :catch_10b
    move-exception v0

    :cond_10c
    move-object v0, v1

    goto/16 :goto_5
.end method

.method public varargs setResolvers([Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->mResolvers:[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    return-object p0
.end method
