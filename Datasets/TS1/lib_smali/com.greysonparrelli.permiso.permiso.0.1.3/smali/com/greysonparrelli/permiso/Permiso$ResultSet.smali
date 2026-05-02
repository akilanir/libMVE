.class public Lcom/greysonparrelli/permiso/Permiso$ResultSet;
.super Ljava/lang/Object;
.source "Permiso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/greysonparrelli/permiso/Permiso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResultSet"
.end annotation


# instance fields
.field private requestResults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private varargs constructor <init>([Ljava/lang/String;)V
    .registers 8
    .param p1, "permissions"    # [Ljava/lang/String;

    .prologue
    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 330
    new-instance v4, Ljava/util/HashMap;

    array-length v5, p1

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    iput-object v4, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    .line 331
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_e
    if-ge v1, v2, :cond_1f

    aget-object v3, v0, v1

    .line 332
    .local v3, "permission":Ljava/lang/String;
    iget-object v4, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 334
    .end local v3    # "permission":Ljava/lang/String;
    :cond_1f
    return-void
.end method

.method synthetic constructor <init>([Ljava/lang/String;Lcom/greysonparrelli/permiso/Permiso$1;)V
    .registers 3
    .param p1, "x0"    # [Ljava/lang/String;
    .param p2, "x1"    # Lcom/greysonparrelli/permiso/Permiso$1;

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;-><init>([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/greysonparrelli/permiso/Permiso$ResultSet;[Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;
    .param p1, "x1"    # [Ljava/lang/String;

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->grantPermissions([Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/greysonparrelli/permiso/Permiso$ResultSet;Landroid/app/Activity;)[Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getPermissionsThatNeedRationale(Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/greysonparrelli/permiso/Permiso$ResultSet;[Ljava/lang/String;[I)V
    .registers 3
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;
    .param p1, "x1"    # [Ljava/lang/String;
    .param p2, "x2"    # [I

    .prologue
    .line 325
    invoke-direct {p0, p1, p2}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->parsePermissionResults([Ljava/lang/String;[I)V

    return-void
.end method

.method static synthetic access$400(Lcom/greysonparrelli/permiso/Permiso$ResultSet;Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Z
    .registers 3
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;
    .param p1, "x1"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .prologue
    .line 325
    invoke-direct {p0, p1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->containsAllUngrantedPermissions(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getUngrantedPermissions()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .prologue
    .line 325
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    return-object v0
.end method

.method private containsAllUngrantedPermissions(Lcom/greysonparrelli/permiso/Permiso$ResultSet;)Z
    .registers 4
    .param p1, "set"    # Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .prologue
    .line 390
    invoke-direct {p1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getUngrantedPermissions()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 391
    .local v0, "ungranted":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    return v1
.end method

.method private getPermissionsThatNeedRationale(Landroid/app/Activity;)[Ljava/lang/String;
    .registers 9
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 395
    invoke-direct {p0}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->getUngrantedPermissions()[Ljava/lang/String;

    move-result-object v5

    .line 396
    .local v5, "ungranted":[Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    array-length v6, v5

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 397
    .local v4, "shouldShowRationale":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_d
    if-ge v1, v2, :cond_1d

    aget-object v3, v0, v1

    .line 398
    .local v3, "permission":Ljava/lang/String;
    invoke-static {p1, v3}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 399
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 402
    .end local v3    # "permission":Ljava/lang/String;
    :cond_1d
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    return-object v6
.end method

.method private getUngrantedPermissions()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 380
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 381
    .local v2, "ungrantedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_15
    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 382
    .local v1, "permission":Ljava/lang/String;
    iget-object v3, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_15

    .line 383
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 386
    .end local v1    # "permission":Ljava/lang/String;
    :cond_33
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3
.end method

.method private varargs grantPermissions([Ljava/lang/String;)V
    .registers 8
    .param p1, "permissions"    # [Ljava/lang/String;

    .prologue
    .line 368
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_14

    aget-object v3, v0, v1

    .line 369
    .local v3, "permission":Ljava/lang/String;
    iget-object v4, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 371
    .end local v3    # "permission":Ljava/lang/String;
    :cond_14
    return-void
.end method

.method private parsePermissionResults([Ljava/lang/String;[I)V
    .registers 7
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "grantResults"    # [I

    .prologue
    .line 374
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_19

    .line 375
    iget-object v2, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    aget-object v3, p1, v0

    aget v1, p2, v0

    if-nez v1, :cond_17

    const/4 v1, 0x1

    :goto_d
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 375
    :cond_17
    const/4 v1, 0x0

    goto :goto_d

    .line 377
    :cond_19
    return-void
.end method


# virtual methods
.method public areAllPermissionsGranted()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 353
    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v0, 0x1

    :cond_e
    return v0
.end method

.method public isPermissionGranted(Ljava/lang/String;)Z
    .registers 3
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 342
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 343
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 345
    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public toMap()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 364
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;->requestResults:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method
