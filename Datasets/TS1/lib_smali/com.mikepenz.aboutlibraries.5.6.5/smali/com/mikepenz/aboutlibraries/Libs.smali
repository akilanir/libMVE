.class public Lcom/mikepenz/aboutlibraries/Libs;
.super Ljava/lang/Object;
.source "Libs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/aboutlibraries/Libs$SpecialButton;,
        Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;,
        Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;
    }
.end annotation


# static fields
.field public static final BUNDLE_COLORS:Ljava/lang/String; = "ABOUT_COLOR"

.field public static final BUNDLE_STYLE:Ljava/lang/String; = "ABOUT_LIBRARIES_STYLE"

.field public static final BUNDLE_THEME:Ljava/lang/String; = "ABOUT_LIBRARIES_THEME"

.field public static final BUNDLE_TITLE:Ljava/lang/String; = "ABOUT_LIBRARIES_TITLE"

.field private static final DEFINE_EXT:Ljava/lang/String; = "define_"

.field private static final DEFINE_INT:Ljava/lang/String; = "define_int_"

.field private static final DEFINE_LICENSE:Ljava/lang/String; = "define_license_"


# instance fields
.field private externLibraries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private internLibraries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field private licenses:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/License;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->internLibraries:Ljava/util/ArrayList;

    .line 60
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->externLibraries:Ljava/util/ArrayList;

    .line 61
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->licenses:Ljava/util/ArrayList;

    .line 64
    invoke-static {p1}, Lcom/mikepenz/aboutlibraries/util/GenericsUtil;->getFields(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "fields":[Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Lcom/mikepenz/aboutlibraries/Libs;->init(Landroid/content/Context;[Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fields"    # [Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/Libs;->internLibraries:Ljava/util/ArrayList;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/Libs;->externLibraries:Ljava/util/ArrayList;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/Libs;->licenses:Ljava/util/ArrayList;

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/Libs;->init(Landroid/content/Context;[Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method private find(Ljava/util/ArrayList;Ljava/lang/String;ZI)Ljava/util/ArrayList;
    .registers 12
    .param p2, "searchTerm"    # Ljava/lang/String;
    .param p3, "idOnly"    # Z
    .param p4, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;",
            "Ljava/lang/String;",
            "ZI)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    const/4 v6, -0x1

    .line 329
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 331
    .local v2, "localLibs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    const/4 v0, 0x0

    .line 332
    .local v0, "count":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 333
    .local v1, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    if-eqz p3, :cond_35

    .line 334
    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 335
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    add-int/lit8 v0, v0, 0x1

    .line 338
    if-eq p4, v6, :cond_b

    if-ge p4, v0, :cond_b

    .line 354
    .end local v1    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_34
    :goto_34
    return-object v2

    .line 343
    .restart local v1    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_35
    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_59

    invoke-virtual {v1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 344
    :cond_59
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 345
    add-int/lit8 v0, v0, 0x1

    .line 347
    if-eq p4, v6, :cond_b

    if-ge p4, v0, :cond_b

    goto :goto_34
.end method

.method private genLibrary(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;
    .registers 12
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libraryName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 399
    const-string v6, "-"

    const-string v7, "_"

    invoke-virtual {p2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 402
    :try_start_9
    new-instance v2, Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-direct {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;-><init>()V

    .line 405
    .local v2, "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/aboutlibraries/Libs;->getCustomVariables(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 407
    .local v0, "customVariables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v2, p2}, Lcom/mikepenz/aboutlibraries/entity/Library;->setDefinedName(Ljava/lang/String;)V

    .line 408
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_author"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setAuthor(Ljava/lang/String;)V

    .line 409
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_authorWebsite"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setAuthorWebsite(Ljava/lang/String;)V

    .line 410
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_libraryName"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryName(Ljava/lang/String;)V

    .line 411
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_libraryDescription"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lcom/mikepenz/aboutlibraries/Libs;->insertVariables(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryDescription(Ljava/lang/String;)V

    .line 412
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_libraryVersion"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryVersion(Ljava/lang/String;)V

    .line 413
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_libraryWebsite"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryWebsite(Ljava/lang/String;)V

    .line 415
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_licenseId"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 416
    .local v4, "licenseId":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1e6

    .line 417
    new-instance v3, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v3}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    .line 418
    .local v3, "license":Lcom/mikepenz/aboutlibraries/entity/License;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_licenseVersion"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseName(Ljava/lang/String;)V

    .line 419
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_licenseLink"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseWebsite(Ljava/lang/String;)V

    .line 420
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_licenseContent"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lcom/mikepenz/aboutlibraries/Libs;->insertVariables(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseShortDescription(Ljava/lang/String;)V

    .line 421
    invoke-virtual {v2, v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V

    .line 432
    :cond_168
    :goto_168
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_isOpenSource"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setOpenSource(Z)V

    .line 433
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_repositoryLink"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setRepositoryLink(Ljava/lang/String;)V

    .line 435
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "library_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_classPath"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setClassPath(Ljava/lang/String;)V

    .line 437
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1e5

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryDescription()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1e5

    move-object v2, v5

    .line 444
    .end local v0    # "customVariables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    .end local v3    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    .end local v4    # "licenseId":Ljava/lang/String;
    :cond_1e5
    :goto_1e5
    return-object v2

    .line 423
    .restart local v0    # "customVariables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    .restart local v4    # "licenseId":Ljava/lang/String;
    :cond_1e6
    invoke-virtual {p0, v4}, Lcom/mikepenz/aboutlibraries/Libs;->getLicense(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    .line 424
    .restart local v3    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    if-eqz v3, :cond_168

    .line 425
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->copy()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v3

    .line 426
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseShortDescription()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lcom/mikepenz/aboutlibraries/Libs;->insertVariables(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseShortDescription(Ljava/lang/String;)V

    .line 427
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseDescription()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lcom/mikepenz/aboutlibraries/Libs;->insertVariables(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseDescription(Ljava/lang/String;)V

    .line 428
    invoke-virtual {v2, v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V
    :try_end_209
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_209} :catch_20b

    goto/16 :goto_168

    .line 442
    .end local v0    # "customVariables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    .end local v3    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    .end local v4    # "licenseId":Ljava/lang/String;
    :catch_20b
    move-exception v1

    .line 443
    .local v1, "ex":Ljava/lang/Exception;
    const-string v6, "aboutlibraries"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to generateLibrary from file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v5

    .line 444
    goto :goto_1e5
.end method

.method private genLicense(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/License;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "licenseName"    # Ljava/lang/String;

    .prologue
    .line 378
    const-string v2, "-"

    const-string v3, "_"

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 381
    :try_start_8
    new-instance v1, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v1}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    .line 382
    .local v1, "lic":Lcom/mikepenz/aboutlibraries/entity/License;
    invoke-virtual {v1, p2}, Lcom/mikepenz/aboutlibraries/entity/License;->setDefinedName(Ljava/lang/String;)V

    .line 383
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "license_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_licenseName"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseName(Ljava/lang/String;)V

    .line 384
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "license_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_licenseWebsite"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseWebsite(Ljava/lang/String;)V

    .line 385
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "license_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_licenseShortDescription"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseShortDescription(Ljava/lang/String;)V

    .line 386
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "license_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_licenseDescription"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseDescription(Ljava/lang/String;)V
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_90} :catch_91

    .line 390
    .end local v1    # "lic":Lcom/mikepenz/aboutlibraries/entity/License;
    :goto_90
    return-object v1

    .line 388
    :catch_91
    move-exception v0

    .line 389
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "aboutlibraries"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to generateLicense from file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    const/4 v1, 0x0

    goto :goto_90
.end method

.method private init(Landroid/content/Context;[Ljava/lang/String;)V
    .registers 16
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "fields"    # [Ljava/lang/String;

    .prologue
    .line 78
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v4, "foundLicenseIdentifiers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v3, "foundInternalLibraryIdentifiers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v2, "foundExternalLibraryIdentifiers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p2, :cond_55

    .line 83
    array-length v10, p2

    const/4 v9, 0x0

    :goto_13
    if-ge v9, v10, :cond_55

    aget-object v1, p2, v9

    .line 84
    .local v1, "field":Ljava/lang/String;
    const-string v11, "define_license_"

    invoke-virtual {v1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2d

    .line 85
    const-string v11, "define_license_"

    const-string v12, ""

    invoke-virtual {v1, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_2a
    :goto_2a
    add-int/lit8 v9, v9, 0x1

    goto :goto_13

    .line 86
    :cond_2d
    const-string v11, "define_int_"

    invoke-virtual {v1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_41

    .line 87
    const-string v11, "define_int_"

    const-string v12, ""

    invoke-virtual {v1, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 88
    :cond_41
    const-string v11, "define_"

    invoke-virtual {v1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2a

    .line 89
    const-string v11, "define_"

    const-string v12, ""

    invoke-virtual {v1, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2a

    .line 95
    .end local v1    # "field":Ljava/lang/String;
    :cond_55
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_59
    :goto_59
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_71

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 96
    .local v8, "licenseIdentifier":Ljava/lang/String;
    invoke-direct {p0, p1, v8}, Lcom/mikepenz/aboutlibraries/Libs;->genLicense(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v7

    .line 97
    .local v7, "license":Lcom/mikepenz/aboutlibraries/entity/License;
    if-eqz v7, :cond_59

    .line 98
    iget-object v10, p0, Lcom/mikepenz/aboutlibraries/Libs;->licenses:Ljava/util/ArrayList;

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_59

    .line 102
    .end local v7    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    .end local v8    # "licenseIdentifier":Ljava/lang/String;
    :cond_71
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_75
    :goto_75
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_91

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 103
    .local v5, "internalIdentifier":Ljava/lang/String;
    invoke-direct {p0, p1, v5}, Lcom/mikepenz/aboutlibraries/Libs;->genLibrary(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;

    move-result-object v6

    .line 104
    .local v6, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    if-eqz v6, :cond_75

    .line 105
    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Lcom/mikepenz/aboutlibraries/entity/Library;->setInternal(Z)V

    .line 106
    iget-object v10, p0, Lcom/mikepenz/aboutlibraries/Libs;->internLibraries:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_75

    .line 111
    .end local v5    # "internalIdentifier":Ljava/lang/String;
    .end local v6    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_91
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_95
    :goto_95
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 112
    .local v0, "externalIdentifier":Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Lcom/mikepenz/aboutlibraries/Libs;->genLibrary(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;

    move-result-object v6

    .line 113
    .restart local v6    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    if-eqz v6, :cond_95

    .line 114
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Lcom/mikepenz/aboutlibraries/entity/Library;->setInternal(Z)V

    .line 115
    iget-object v10, p0, Lcom/mikepenz/aboutlibraries/Libs;->externLibraries:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_95

    .line 118
    .end local v0    # "externalIdentifier":Ljava/lang/String;
    .end local v6    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_b1
    return-void
.end method

.method public static toStringArray([Ljava/lang/reflect/Field;)[Ljava/lang/String;
    .registers 7
    .param p0, "fields"    # [Ljava/lang/reflect/Field;

    .prologue
    .line 128
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v1, "fieldArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    array-length v3, p0

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_21

    aget-object v0, p0, v2

    .line 130
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "define_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 131
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 134
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_21
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method


# virtual methods
.method public findInExternalLibrary(Ljava/lang/String;ZI)Ljava/util/ArrayList;
    .registers 5
    .param p1, "searchTerm"    # Ljava/lang/String;
    .param p2, "idOnly"    # Z
    .param p3, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZI)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getExternLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/mikepenz/aboutlibraries/Libs;->find(Ljava/util/ArrayList;Ljava/lang/String;ZI)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public findInInternalLibrary(Ljava/lang/String;ZI)Ljava/util/ArrayList;
    .registers 5
    .param p1, "searchTerm"    # Ljava/lang/String;
    .param p2, "idOnly"    # Z
    .param p3, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZI)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 308
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getInternLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/mikepenz/aboutlibraries/Libs;->find(Ljava/util/ArrayList;Ljava/lang/String;ZI)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public findLibrary(Ljava/lang/String;I)Ljava/util/ArrayList;
    .registers 5
    .param p1, "searchTerm"    # Ljava/lang/String;
    .param p2, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 298
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lcom/mikepenz/aboutlibraries/Libs;->find(Ljava/util/ArrayList;Ljava/lang/String;ZI)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getAutoDetectedLibraries(Landroid/content/Context;)Ljava/util/ArrayList;
    .registers 13
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 200
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v5, "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    invoke-static {p1}, Lcom/mikepenz/aboutlibraries/util/Util;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v6

    .line 203
    .local v6, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v6, :cond_48

    .line 204
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "aboutLibraries_"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v9, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string v9, "autoDetectedLibraries"

    const-string v10, ""

    invoke-interface {v7, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, ";"

    invoke-virtual {v7, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "autoDetectedLibraries":[Ljava/lang/String;
    array-length v7, v0

    if-lez v7, :cond_48

    .line 207
    array-length v9, v0

    move v7, v8

    :goto_38
    if-ge v7, v9, :cond_48

    aget-object v2, v0, v7

    .line 208
    .local v2, "autoDetectedLibrary":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/mikepenz/aboutlibraries/Libs;->getLibrary(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;

    move-result-object v4

    .line 209
    .local v4, "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    if-eqz v4, :cond_45

    .line 210
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    :cond_45
    add-int/lit8 v7, v7, 0x1

    goto :goto_38

    .line 216
    .end local v0    # "autoDetectedLibraries":[Ljava/lang/String;
    .end local v2    # "autoDetectedLibrary":Ljava/lang/String;
    .end local v4    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_48
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_b1

    .line 217
    const-string v3, ""

    .line 218
    .local v3, "delimiter":Ljava/lang/String;
    const-string v1, ""

    .line 219
    .local v1, "autoDetectedLibrariesPref":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getLibraries()Ljava/util/ArrayList;

    move-result-object v7

    invoke-static {p1, v7}, Lcom/mikepenz/aboutlibraries/detector/Detect;->detect(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_89

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 220
    .restart local v4    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 223
    const-string v3, ";"

    .line 224
    goto :goto_5e

    .line 226
    .end local v4    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_89
    if-eqz v6, :cond_b1

    .line 227
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "aboutLibraries_"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v9, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "autoDetectedLibraries"

    invoke-interface {v7, v8, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 231
    .end local v1    # "autoDetectedLibrariesPref":Ljava/lang/String;
    .end local v3    # "delimiter":Ljava/lang/String;
    :cond_b1
    return-object v5
.end method

.method public getCustomVariables(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;
    .registers 12
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "libraryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 453
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 455
    .local v3, "customVariables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "define_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p1, v5}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 456
    .local v4, "customVariablesString":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_39

    .line 457
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "define_int_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p1, v5}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 460
    :cond_39
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7b

    .line 461
    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 462
    .local v0, "customVariableArray":[Ljava/lang/String;
    array-length v5, v0

    if-lez v5, :cond_7b

    .line 463
    array-length v6, v0

    const/4 v5, 0x0

    :goto_4a
    if-ge v5, v6, :cond_7b

    aget-object v2, v0, v5

    .line 464
    .local v2, "customVariableKey":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "library_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, p1, v7}, Lcom/mikepenz/aboutlibraries/Libs;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 465
    .local v1, "customVariableContent":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_78

    .line 466
    invoke-virtual {v3, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    :cond_78
    add-int/lit8 v5, v5, 0x1

    goto :goto_4a

    .line 472
    .end local v0    # "customVariableArray":[Ljava/lang/String;
    .end local v1    # "customVariableContent":Ljava/lang/String;
    .end local v2    # "customVariableKey":Ljava/lang/String;
    :cond_7b
    return-object v3
.end method

.method public getExternLibraries()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 249
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->externLibraries:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getInternLibraries()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 240
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->internLibraries:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getLibraries()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 268
    .local v0, "libs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getInternLibraries()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 269
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getExternLibraries()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 270
    return-object v0
.end method

.method public getLibrary(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;
    .registers 6
    .param p1, "libraryName"    # Ljava/lang/String;

    .prologue
    .line 280
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getLibraries()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 281
    .local v0, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 287
    .end local v0    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :goto_26
    return-object v0

    .line 283
    .restart local v0    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_27
    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_26

    .line 287
    .end local v0    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_3a
    const/4 v0, 0x0

    goto :goto_26
.end method

.method public getLicense(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/License;
    .registers 6
    .param p1, "licenseName"    # Ljava/lang/String;

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getLicenses()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/entity/License;

    .line 364
    .local v0, "license":Lcom/mikepenz/aboutlibraries/entity/License;
    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/entity/License;->getLicenseName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 370
    .end local v0    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    :goto_26
    return-object v0

    .line 366
    .restart local v0    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    :cond_27
    invoke-virtual {v0}, Lcom/mikepenz/aboutlibraries/entity/License;->getDefinedName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    goto :goto_26

    .line 370
    .end local v0    # "license":Lcom/mikepenz/aboutlibraries/entity/License;
    :cond_3a
    const/4 v0, 0x0

    goto :goto_26
.end method

.method public getLicenses()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/License;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/Libs;->licenses:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "aString"    # Ljava/lang/String;

    .prologue
    .line 490
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 492
    .local v0, "packageName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "string"

    invoke-virtual {v2, p2, v3, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 493
    .local v1, "resId":I
    if-nez v1, :cond_13

    .line 494
    const-string v2, ""

    .line 496
    :goto_12
    return-object v2

    :cond_13
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_12
.end method

.method public insertVariables(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .registers 7
    .param p1, "insertInto"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 476
    .local p2, "variables":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 477
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 478
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<<<"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ">>>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    goto :goto_8

    .line 483
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4e
    const-string v1, "<<<"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 484
    const-string v1, ">>>"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 486
    return-object p1
.end method

.method public modifyLibraries(Ljava/util/HashMap;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "modifications":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v9, 0x1

    .line 505
    if-eqz p1, :cond_18f

    .line 506
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_18f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 507
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {p0, v6, v9, v9}, Lcom/mikepenz/aboutlibraries/Libs;->findInExternalLibrary(Ljava/lang/String;ZI)Ljava/util/ArrayList;

    move-result-object v1

    .line 508
    .local v1, "foundLibs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    if-eqz v1, :cond_29

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_33

    .line 509
    :cond_29
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {p0, v6, v9, v9}, Lcom/mikepenz/aboutlibraries/Libs;->findInInternalLibrary(Ljava/lang/String;ZI)Ljava/util/ArrayList;

    move-result-object v1

    .line 512
    :cond_33
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v6, v9, :cond_b

    .line 513
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 514
    .local v3, "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_50
    :goto_50
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 515
    .local v4, "modification":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    .line 516
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 518
    .local v5, "value":Ljava/lang/String;
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7c

    .line 519
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setAuthor(Ljava/lang/String;)V

    goto :goto_50

    .line 520
    :cond_7c
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8c

    .line 521
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setAuthorWebsite(Ljava/lang/String;)V

    goto :goto_50

    .line 522
    :cond_8c
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9c

    .line 523
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryName(Ljava/lang/String;)V

    goto :goto_50

    .line 524
    :cond_9c
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ac

    .line 525
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryDescription(Ljava/lang/String;)V

    goto :goto_50

    .line 526
    :cond_ac
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_VERSION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_bc

    .line 527
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryVersion(Ljava/lang/String;)V

    goto :goto_50

    .line 528
    :cond_bc
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_cc

    .line 529
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLibraryWebsite(Ljava/lang/String;)V

    goto :goto_50

    .line 530
    :cond_cc
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_OPEN_SOURCE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e1

    .line 531
    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setOpenSource(Z)V

    goto/16 :goto_50

    .line 532
    :cond_e1
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_REPOSITORY_LINK:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f2

    .line 533
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setRepositoryLink(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 534
    :cond_f2
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_CLASSPATH:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_103

    .line 536
    invoke-virtual {v3, v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->setClassPath(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 537
    :cond_103
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_126

    .line 538
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    if-nez v6, :cond_11d

    .line 539
    new-instance v6, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v6}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V

    .line 541
    :cond_11d
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseName(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 542
    :cond_126
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_SHORT_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_149

    .line 543
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    if-nez v6, :cond_140

    .line 544
    new-instance v6, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v6}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V

    .line 546
    :cond_140
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseShortDescription(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 547
    :cond_149
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16c

    .line 548
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    if-nez v6, :cond_163

    .line 549
    new-instance v6, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v6}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V

    .line 551
    :cond_163
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseDescription(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 552
    :cond_16c
    sget-object v6, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_50

    .line 553
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    if-nez v6, :cond_186

    .line 554
    new-instance v6, Lcom/mikepenz/aboutlibraries/entity/License;

    invoke-direct {v6}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>()V

    invoke-virtual {v3, v6}, Lcom/mikepenz/aboutlibraries/entity/Library;->setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V

    .line 556
    :cond_186
    invoke-virtual {v3}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLicense()Lcom/mikepenz/aboutlibraries/entity/License;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/mikepenz/aboutlibraries/entity/License;->setLicenseWebsite(Ljava/lang/String;)V

    goto/16 :goto_50

    .line 562
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v1    # "foundLibs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    .end local v4    # "modification":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :cond_18f
    return-void
.end method

.method public prepareLibraries(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;ZZ)Ljava/util/ArrayList;
    .registers 18
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "internalLibraries"    # [Ljava/lang/String;
    .param p3, "excludeLibraries"    # [Ljava/lang/String;
    .param p4, "autoDetect"    # Z
    .param p5, "sort"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "ZZ)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 149
    .local v4, "libraries":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    if-eqz p4, :cond_23

    .line 150
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/Libs;->getAutoDetectedLibraries(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_23

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 151
    .local v2, "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    .line 156
    .end local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_23
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/Libs;->getExternLibraries()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 157
    .restart local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    .line 161
    .end local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_3f
    if-eqz p2, :cond_57

    .line 162
    array-length v9, p2

    const/4 v8, 0x0

    :goto_43
    if-ge v8, v9, :cond_57

    aget-object v1, p2, v8

    .line 163
    .local v1, "internalLibrary":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/mikepenz/aboutlibraries/Libs;->getLibrary(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/entity/Library;

    move-result-object v2

    .line 164
    .restart local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    if-eqz v2, :cond_54

    .line 165
    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    :cond_54
    add-int/lit8 v8, v8, 0x1

    goto :goto_43

    .line 170
    .end local v1    # "internalLibrary":Ljava/lang/String;
    .end local v2    # "lib":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_57
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 173
    .local v7, "resultLibraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    if-eqz p3, :cond_a1

    .line 174
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v6, "libsToRemove":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    array-length v9, p3

    const/4 v8, 0x0

    :goto_69
    if-ge v8, v9, :cond_8d

    aget-object v0, p3, v8

    .line 176
    .local v0, "excludeLibrary":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_71
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 177
    .local v5, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v5}, Lcom/mikepenz/aboutlibraries/entity/Library;->getDefinedName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_71

    .line 178
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .end local v5    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    :cond_8a
    add-int/lit8 v8, v8, 0x1

    goto :goto_69

    .line 183
    .end local v0    # "excludeLibrary":Ljava/lang/String;
    :cond_8d
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_91
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 184
    .local v3, "libToRemove":Lcom/mikepenz/aboutlibraries/entity/Library;
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_91

    .line 188
    .end local v3    # "libToRemove":Lcom/mikepenz/aboutlibraries/entity/Library;
    .end local v6    # "libsToRemove":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    :cond_a1
    if-eqz p5, :cond_a6

    .line 189
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 191
    :cond_a6
    return-object v7
.end method
