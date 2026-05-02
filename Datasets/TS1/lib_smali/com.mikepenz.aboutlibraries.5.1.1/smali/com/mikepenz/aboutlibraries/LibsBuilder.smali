.class public Lcom/mikepenz/aboutlibraries/LibsBuilder;
.super Ljava/lang/Object;
.source "LibsBuilder.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public aboutAppName:Ljava/lang/String;

.field public aboutAppSpecial1:Ljava/lang/String;

.field public aboutAppSpecial1Description:Ljava/lang/String;

.field public aboutAppSpecial2:Ljava/lang/String;

.field public aboutAppSpecial2Description:Ljava/lang/String;

.field public aboutAppSpecial3:Ljava/lang/String;

.field public aboutAppSpecial3Description:Ljava/lang/String;

.field public aboutDescription:Ljava/lang/String;

.field public aboutShowIcon:Ljava/lang/Boolean;

.field public aboutShowVersion:Ljava/lang/Boolean;

.field public aboutShowVersionCode:Ljava/lang/Boolean;

.field public aboutShowVersionName:Ljava/lang/Boolean;

.field public activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

.field public activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

.field public activityTheme:Ljava/lang/Integer;

.field public activityTitle:Ljava/lang/String;

.field public animate:Ljava/lang/Boolean;

.field public autoDetect:Ljava/lang/Boolean;

.field public excludeLibraries:[Ljava/lang/String;

.field public fields:[Ljava/lang/String;

.field public internalLibraries:[Ljava/lang/String;

.field public libraryComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;"
        }
    .end annotation
.end field

.field public libraryModification:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public showLicense:Ljava/lang/Boolean;

.field public showLicenseDialog:Ljava/lang/Boolean;

.field public showVersion:Ljava/lang/Boolean;

.field public sort:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    .line 22
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    .line 23
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    .line 25
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    .line 26
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 27
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    .line 28
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->animate:Ljava/lang/Boolean;

    .line 30
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    .line 31
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicenseDialog:Ljava/lang/Boolean;

    .line 32
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    .line 34
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 35
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 36
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 37
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 38
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 39
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 41
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 42
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 43
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 44
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 48
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    .line 49
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    .line 50
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 51
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 53
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 56
    return-void
.end method

.method private preCheck()V
    .registers 3

    .prologue
    .line 396
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v0, :cond_b

    .line 397
    const-string v0, "AboutLibraries"

    const-string v1, "Have you missed to call withFields(R.string.class.getFields())? - autoDetect won\'t work - https://github.com/mikepenz/AboutLibraries/wiki/HOWTO:-Fragment"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    :cond_b
    return-void
.end method


# virtual methods
.method public activity(Landroid/content/Context;)V
    .registers 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 465
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->start(Landroid/content/Context;)V

    .line 466
    return-void
.end method

.method public adapter(Landroid/content/Context;)Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 409
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v1, :cond_2c

    .line 410
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    invoke-direct {v0, p1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;)V

    .line 416
    .local v0, "libs":Lcom/mikepenz/aboutlibraries/Libs;
    :goto_9
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;->modifyLibraries(Ljava/util/HashMap;)V

    .line 419
    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/mikepenz/aboutlibraries/Libs;->prepareLibraries(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;ZZ)Ljava/util/ArrayList;

    move-result-object v7

    .line 422
    .local v7, "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    new-instance v6, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;

    invoke-direct {v6, p0}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;-><init>(Lcom/mikepenz/aboutlibraries/LibsBuilder;)V

    .line 423
    .local v6, "adapter":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    invoke-virtual {v6, v7}, Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;->addLibs(Ljava/util/List;)V

    .line 424
    return-object v6

    .line 412
    .end local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    .end local v6    # "adapter":Lcom/mikepenz/aboutlibraries/ui/adapter/LibsRecyclerViewAdapter;
    .end local v7    # "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    :cond_2c
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .restart local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    goto :goto_9
.end method

.method public fragment()Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
    .registers 4

    .prologue
    .line 475
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 476
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "data"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 478
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;

    invoke-direct {v1}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;-><init>()V

    .line 479
    .local v1, "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsFragment;
    invoke-virtual {v1, v0}, Lcom/mikepenz/aboutlibraries/ui/LibsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 481
    return-object v1
.end method

.method public intent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 434
    invoke-direct {p0}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->preCheck()V

    .line 436
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 437
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "data"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 438
    const-string v1, "ABOUT_LIBRARIES_THEME"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 439
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    if-eqz v1, :cond_21

    .line 440
    const-string v1, "ABOUT_LIBRARIES_TITLE"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 442
    :cond_21
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    if-eqz v1, :cond_2c

    .line 443
    const-string v1, "ABOUT_COLOR"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 446
    :cond_2c
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-eqz v1, :cond_3b

    .line 447
    const-string v1, "ABOUT_LIBRARIES_STYLE"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 450
    :cond_3b
    return-object v0
.end method

.method public start(Landroid/content/Context;)V
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 457
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 458
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 459
    return-void
.end method

.method public withAboutAppName(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppName"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 235
    return-object p0
.end method

.method public withAboutDescription(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutDescription"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 246
    return-object p0
.end method

.method public withAboutIconShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowIcon"    # Z

    .prologue
    .line 188
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 189
    return-object p0
.end method

.method public withAboutSpecial1(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial1"    # Ljava/lang/String;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 255
    return-object p0
.end method

.method public withAboutSpecial1Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial1Description"    # Ljava/lang/String;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 264
    return-object p0
.end method

.method public withAboutSpecial2(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial2"    # Ljava/lang/String;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 273
    return-object p0
.end method

.method public withAboutSpecial2Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial2Description"    # Ljava/lang/String;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 282
    return-object p0
.end method

.method public withAboutSpecial3(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial3"    # Ljava/lang/String;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 291
    return-object p0
.end method

.method public withAboutSpecial3Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial3Description"    # Ljava/lang/String;

    .prologue
    .line 299
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 300
    return-object p0
.end method

.method public withAboutVersionShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 199
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 200
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 201
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 202
    return-object p0
.end method

.method public withAboutVersionShownCode(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 223
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 224
    return-object p0
.end method

.method public withAboutVersionShownName(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 212
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 213
    return-object p0
.end method

.method public withActivityColor(Lcom/mikepenz/aboutlibraries/util/Colors;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "activityColor"    # Lcom/mikepenz/aboutlibraries/util/Colors;

    .prologue
    .line 332
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 333
    return-object p0
.end method

.method public withActivityStyle(Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "libraryStyle"    # Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 344
    return-object p0
.end method

.method public withActivityTheme(I)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "activityTheme"    # I

    .prologue
    .line 310
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    .line 311
    return-object p0
.end method

.method public withActivityTitle(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "activityTitle"    # Ljava/lang/String;

    .prologue
    .line 321
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    .line 322
    return-object p0
.end method

.method public withAnimations(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 144
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->animate:Ljava/lang/Boolean;

    .line 145
    return-object p0
.end method

.method public withAutoDetect(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "autoDetect"    # Z

    .prologue
    .line 109
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    .line 110
    return-object p0
.end method

.method public varargs withExcludedLibraries([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "excludeLibraries"    # [Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    .line 99
    return-object p0
.end method

.method public varargs withFields([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "fields"    # [Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    .line 77
    return-object p0
.end method

.method public withFields([Ljava/lang/reflect/Field;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "fields"    # [Ljava/lang/reflect/Field;

    .prologue
    .line 66
    invoke-static {p1}, Lcom/mikepenz/aboutlibraries/Libs;->toStringArray([Ljava/lang/reflect/Field;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->withFields([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs withLibraries([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "libraries"    # [Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    .line 88
    return-object p0
.end method

.method public withLibraryComparator(Ljava/util/Comparator;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lcom/mikepenz/aboutlibraries/entity/Library;",
            ">;)",
            "Lcom/mikepenz/aboutlibraries/LibsBuilder;"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, "libraryComparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    .line 133
    if-eqz p1, :cond_c

    const/4 v0, 0x1

    :goto_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 134
    return-object p0

    .line 133
    :cond_c
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public withLibraryModification(Ljava/lang/String;Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 6
    .param p1, "library"    # Ljava/lang/String;
    .param p2, "modificationKey"    # Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;
    .param p3, "modificationValue"    # Ljava/lang/String;

    .prologue
    .line 367
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    if-nez v0, :cond_b

    .line 368
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 371
    :cond_b
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 372
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    :cond_1d
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {p2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    return-object p0
.end method

.method public withLibraryModification(Ljava/util/HashMap;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
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
            ">;>;)",
            "Lcom/mikepenz/aboutlibraries/LibsBuilder;"
        }
    .end annotation

    .prologue
    .line 354
    .local p1, "libraryModification":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 355
    return-object p0
.end method

.method public withLicenseDialog(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showLicenseDialog"    # Z

    .prologue
    .line 166
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicenseDialog:Ljava/lang/Boolean;

    .line 167
    return-object p0
.end method

.method public withLicenseShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showLicense"    # Z

    .prologue
    .line 155
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    .line 156
    return-object p0
.end method

.method public withListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "libsListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .prologue
    .line 387
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)V

    .line 388
    return-object p0
.end method

.method public withSortEnabled(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "sort"    # Z

    .prologue
    .line 120
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 121
    return-object p0
.end method

.method public withVersionShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showVersion"    # Z

    .prologue
    .line 177
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    .line 178
    return-object p0
.end method
