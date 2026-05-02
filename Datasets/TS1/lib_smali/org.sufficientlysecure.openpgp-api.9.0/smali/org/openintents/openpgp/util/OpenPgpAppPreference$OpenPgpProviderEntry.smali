.class Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;
.super Ljava/lang/Object;
.source "OpenPgpAppPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/openintents/openpgp/util/OpenPgpAppPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OpenPgpProviderEntry"
.end annotation


# instance fields
.field private icon:Landroid/graphics/drawable/Drawable;

.field private intent:Landroid/content/Intent;

.field private packageName:Ljava/lang/String;

.field private simpleName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-object p1, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;

    .line 313
    iput-object p2, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    .line 314
    iput-object p3, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;

    .line 315
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/content/Intent;)V
    .registers 5
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p4, "intent"    # Landroid/content/Intent;

    .prologue
    .line 318
    invoke-direct {p0, p1, p2, p3}, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 319
    iput-object p4, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;

    .line 320
    return-void
.end method

.method static synthetic access$100(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    .prologue
    .line 305
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$200(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Landroid/content/Intent;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    .prologue
    .line 305
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->intent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$400(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    .prologue
    .line 305
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;

    .prologue
    .line 305
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 324
    iget-object v0, p0, Lorg/openintents/openpgp/util/OpenPgpAppPreference$OpenPgpProviderEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method
