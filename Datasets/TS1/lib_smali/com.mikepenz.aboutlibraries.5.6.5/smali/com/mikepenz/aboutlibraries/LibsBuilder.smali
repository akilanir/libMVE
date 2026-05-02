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

.field public aboutVersionString:Ljava/lang/String;

.field public activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

.field public activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

.field public activityTheme:Ljava/lang/Integer;

.field public activityTitle:Ljava/lang/String;

.field public autoDetect:Ljava/lang/Boolean;

.field public excludeLibraries:[Ljava/lang/String;

.field public fields:[Ljava/lang/String;

.field public internalLibraries:[Ljava/lang/String;

.field public libTaskExecutor:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

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

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    .line 25
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    .line 26
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    .line 28
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    .line 29
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 30
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    .line 32
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    .line 33
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicenseDialog:Ljava/lang/Boolean;

    .line 34
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    .line 36
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 37
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutVersionString:Ljava/lang/String;

    .line 38
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 39
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 40
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 41
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 42
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 44
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 45
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 47
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 48
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 51
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    .line 52
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    .line 53
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 54
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 56
    sget-object v0, Lcom/mikepenz/aboutlibraries/LibTaskExecutor;->DEFAULT_EXECUTOR:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libTaskExecutor:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .line 58
    iput-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 61
    return-void
.end method

.method private preCheck()V
    .registers 3

    .prologue
    .line 462
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v0, :cond_b

    .line 463
    const-string v0, "AboutLibraries"

    const-string v1, "Have you missed to call withFields(R.string.class.getFields())? - autoDetect won\'t work - https://github.com/mikepenz/AboutLibraries/wiki/HOWTO:-Fragment"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    :cond_b
    return-void
.end method


# virtual methods
.method public activity(Landroid/content/Context;)V
    .registers 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 536
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->start(Landroid/content/Context;)V

    .line 537
    return-void
.end method

.method public adapter(Landroid/content/Context;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 475
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    if-nez v1, :cond_4e

    .line 476
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    invoke-direct {v0, p1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;)V

    .line 482
    .local v0, "libs":Lcom/mikepenz/aboutlibraries/Libs;
    :goto_9
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/mikepenz/aboutlibraries/Libs;->modifyLibraries(Ljava/util/HashMap;)V

    .line 485
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

    .line 488
    .local v7, "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    new-instance v6, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    invoke-direct {v6}, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;-><init>()V

    .line 489
    .local v6, "adapter":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 490
    .local v9, "libraryItems":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_31
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mikepenz/aboutlibraries/entity/Library;

    .line 491
    .local v8, "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    new-instance v2, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    invoke-direct {v2}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;-><init>()V

    invoke-virtual {v2, v8}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->withLibrary(Lcom/mikepenz/aboutlibraries/entity/Library;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;->withLibsBuilder(Lcom/mikepenz/aboutlibraries/LibsBuilder;)Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 478
    .end local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    .end local v6    # "adapter":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .end local v7    # "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    .end local v8    # "library":Lcom/mikepenz/aboutlibraries/entity/Library;
    .end local v9    # "libraryItems":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;>;"
    :cond_4e
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/aboutlibraries/Libs;-><init>(Landroid/content/Context;[Ljava/lang/String;)V

    .restart local v0    # "libs":Lcom/mikepenz/aboutlibraries/Libs;
    goto :goto_9

    .line 494
    .restart local v6    # "adapter":Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;
    .restart local v7    # "libraries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    .restart local v9    # "libraryItems":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/aboutlibraries/ui/item/LibraryItem;>;"
    :cond_56
    invoke-virtual {v6, v9}, Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;->add(Ljava/util/List;)Lcom/mikepenz/fastadapter/adapters/FastItemAdapter;

    .line 495
    return-object v6
.end method

.method public intent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 505
    invoke-direct {p0}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->preCheck()V

    .line 507
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mikepenz/aboutlibraries/ui/LibsActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 508
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "data"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 509
    const-string v1, "ABOUT_LIBRARIES_THEME"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 510
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    if-eqz v1, :cond_21

    .line 511
    const-string v1, "ABOUT_LIBRARIES_TITLE"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 513
    :cond_21
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    if-eqz v1, :cond_2c

    .line 514
    const-string v1, "ABOUT_COLOR"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 517
    :cond_2c
    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    if-eqz v1, :cond_3b

    .line 518
    const-string v1, "ABOUT_LIBRARIES_STYLE"

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    invoke-virtual {v2}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 521
    :cond_3b
    return-object v0
.end method

.method public start(Landroid/content/Context;)V
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 528
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 529
    .local v0, "i":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 530
    return-void
.end method

.method public supportFragment()Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    .registers 4

    .prologue
    .line 545
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 546
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v2, "data"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 548
    new-instance v1, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;

    invoke-direct {v1}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;-><init>()V

    .line 549
    .local v1, "fragment":Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;
    invoke-virtual {v1, v0}, Lcom/mikepenz/aboutlibraries/ui/LibsSupportFragment;->setArguments(Landroid/os/Bundle;)V

    .line 551
    return-object v1
.end method

.method public withAboutAppName(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppName"    # Ljava/lang/String;

    .prologue
    .line 239
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppName:Ljava/lang/String;

    .line 240
    return-object p0
.end method

.method public withAboutDescription(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutDescription"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutDescription:Ljava/lang/String;

    .line 251
    return-object p0
.end method

.method public withAboutIconShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowIcon"    # Z

    .prologue
    .line 182
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowIcon:Ljava/lang/Boolean;

    .line 183
    return-object p0
.end method

.method public withAboutSpecial1(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial1"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1:Ljava/lang/String;

    .line 260
    return-object p0
.end method

.method public withAboutSpecial1Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial1Description"    # Ljava/lang/String;

    .prologue
    .line 268
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial1Description:Ljava/lang/String;

    .line 269
    return-object p0
.end method

.method public withAboutSpecial2(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial2"    # Ljava/lang/String;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2:Ljava/lang/String;

    .line 278
    return-object p0
.end method

.method public withAboutSpecial2Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial2Description"    # Ljava/lang/String;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial2Description:Ljava/lang/String;

    .line 287
    return-object p0
.end method

.method public withAboutSpecial3(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial3"    # Ljava/lang/String;

    .prologue
    .line 295
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3:Ljava/lang/String;

    .line 296
    return-object p0
.end method

.method public withAboutSpecial3Description(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutAppSpecial3Description"    # Ljava/lang/String;

    .prologue
    .line 304
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutAppSpecial3Description:Ljava/lang/String;

    .line 305
    return-object p0
.end method

.method public withAboutVersionShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 193
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersion:Ljava/lang/Boolean;

    .line 194
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 195
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 196
    return-object p0
.end method

.method public withAboutVersionShownCode(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 217
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionCode:Ljava/lang/Boolean;

    .line 218
    return-object p0
.end method

.method public withAboutVersionShownName(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "aboutShowVersion"    # Z

    .prologue
    .line 206
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutShowVersionName:Ljava/lang/Boolean;

    .line 207
    return-object p0
.end method

.method public withAboutVersionString(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "aboutVersionString"    # Ljava/lang/String;

    .prologue
    .line 228
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->aboutVersionString:Ljava/lang/String;

    .line 229
    return-object p0
.end method

.method public withActivityColor(Lcom/mikepenz/aboutlibraries/util/Colors;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "activityColor"    # Lcom/mikepenz/aboutlibraries/util/Colors;

    .prologue
    .line 337
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityColor:Lcom/mikepenz/aboutlibraries/util/Colors;

    .line 338
    return-object p0
.end method

.method public withActivityStyle(Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "libraryStyle"    # Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .prologue
    .line 348
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityStyle:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 349
    return-object p0
.end method

.method public withActivityTheme(I)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "activityTheme"    # I

    .prologue
    .line 315
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTheme:Ljava/lang/Integer;

    .line 316
    return-object p0
.end method

.method public withActivityTitle(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "activityTitle"    # Ljava/lang/String;

    .prologue
    .line 326
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->activityTitle:Ljava/lang/String;

    .line 327
    return-object p0
.end method

.method public withAutoDetect(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "autoDetect"    # Z

    .prologue
    .line 114
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->autoDetect:Ljava/lang/Boolean;

    .line 115
    return-object p0
.end method

.method public varargs withExcludedLibraries([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "excludeLibraries"    # [Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->excludeLibraries:[Ljava/lang/String;

    .line 104
    return-object p0
.end method

.method public varargs withFields([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "fields"    # [Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->fields:[Ljava/lang/String;

    .line 82
    return-object p0
.end method

.method public withFields([Ljava/lang/reflect/Field;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "fields"    # [Ljava/lang/reflect/Field;

    .prologue
    .line 71
    invoke-static {p1}, Lcom/mikepenz/aboutlibraries/Libs;->toStringArray([Ljava/lang/reflect/Field;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/aboutlibraries/LibsBuilder;->withFields([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withLayoutAnimationController(Landroid/view/animation/LayoutAnimationController;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "layoutAnimationController"    # Landroid/view/animation/LayoutAnimationController;

    .prologue
    .line 426
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setLayoutAnimationController(Landroid/view/animation/LayoutAnimationController;)V

    .line 427
    return-object p0
.end method

.method public withLibTaskCallback(Lcom/mikepenz/aboutlibraries/LibTaskCallback;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "libTaskCallback"    # Lcom/mikepenz/aboutlibraries/LibTaskCallback;

    .prologue
    .line 452
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setLibTaskCallback(Lcom/mikepenz/aboutlibraries/LibTaskCallback;)V

    .line 453
    return-object p0
.end method

.method public withLibTaskExecutor(Lcom/mikepenz/aboutlibraries/LibTaskExecutor;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "libTaskExecutor"    # Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .prologue
    .line 437
    if-eqz p1, :cond_4

    .line 438
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libTaskExecutor:Lcom/mikepenz/aboutlibraries/LibTaskExecutor;

    .line 440
    :cond_4
    return-object p0
.end method

.method public varargs withLibraries([Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 2
    .param p1, "libraries"    # [Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->internalLibraries:[Ljava/lang/String;

    .line 93
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
    .line 137
    .local p1, "libraryComparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/mikepenz/aboutlibraries/entity/Library;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryComparator:Ljava/util/Comparator;

    .line 138
    if-eqz p1, :cond_c

    const/4 v0, 0x1

    :goto_5
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 139
    return-object p0

    .line 138
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
    .line 372
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    if-nez v0, :cond_b

    .line 373
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 376
    :cond_b
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 377
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    :cond_1d
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {p2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
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
    .line 359
    .local p1, "libraryModification":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->libraryModification:Ljava/util/HashMap;

    .line 360
    return-object p0
.end method

.method public withLibsRecyclerViewListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "recyclerViewListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;

    .prologue
    .line 403
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setLibsRecyclerViewListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsRecyclerViewListener;)V

    .line 404
    return-object p0
.end method

.method public withLicenseDialog(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showLicenseDialog"    # Z

    .prologue
    .line 160
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicenseDialog:Ljava/lang/Boolean;

    .line 161
    return-object p0
.end method

.method public withLicenseShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showLicense"    # Z

    .prologue
    .line 149
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showLicense:Ljava/lang/Boolean;

    .line 150
    return-object p0
.end method

.method public withListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "libsListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;

    .prologue
    .line 392
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsListener;)V

    .line 393
    return-object p0
.end method

.method public withSortEnabled(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "sort"    # Z

    .prologue
    .line 125
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->sort:Ljava/lang/Boolean;

    .line 126
    return-object p0
.end method

.method public withUiListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "uiListener"    # Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;

    .prologue
    .line 415
    invoke-static {}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->getInstance()Lcom/mikepenz/aboutlibraries/LibsConfiguration;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mikepenz/aboutlibraries/LibsConfiguration;->setUiListener(Lcom/mikepenz/aboutlibraries/LibsConfiguration$LibsUIListener;)V

    .line 416
    return-object p0
.end method

.method public withVersionShown(Z)Lcom/mikepenz/aboutlibraries/LibsBuilder;
    .registers 3
    .param p1, "showVersion"    # Z

    .prologue
    .line 171
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/LibsBuilder;->showVersion:Ljava/lang/Boolean;

    .line 172
    return-object p0
.end method
