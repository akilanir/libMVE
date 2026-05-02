.class public Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;
.super Ljava/security/BasicPermission;
.source "ProviderConfigurationPermission.java"


# static fields
.field private static final ALL:I = 0xf

.field private static final ALL_STR:Ljava/lang/String; = "all"

.field private static final DH_DEFAULT_PARAMS:I = 0x8

.field private static final DH_DEFAULT_PARAMS_STR:Ljava/lang/String; = "dhdefaultparams"

.field private static final EC_IMPLICITLY_CA:I = 0x2

.field private static final EC_IMPLICITLY_CA_STR:Ljava/lang/String; = "ecimplicitlyca"

.field private static final THREAD_LOCAL_DH_DEFAULT_PARAMS:I = 0x4

.field private static final THREAD_LOCAL_DH_DEFAULT_PARAMS_STR:Ljava/lang/String; = "threadlocaldhdefaultparams"

.field private static final THREAD_LOCAL_EC_IMPLICITLY_CA:I = 0x1

.field private static final THREAD_LOCAL_EC_IMPLICITLY_CA_STR:Ljava/lang/String; = "threadlocalecimplicitlyca"


# instance fields
.field private final actions:Ljava/lang/String;

.field private final permissionMask:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Ljava/security/BasicPermission;-><init>(Ljava/lang/String;)V

    .line 50
    const-string v0, "all"

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->actions:Ljava/lang/String;

    .line 51
    const/16 v0, 0xf

    iput v0, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "actions"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Ljava/security/BasicPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->actions:Ljava/lang/String;

    .line 58
    invoke-direct {p0, p2}, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->calculateMask(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    .line 59
    return-void
.end method

.method private calculateMask(Ljava/lang/String;)I
    .registers 7
    .param p1, "actions"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, " ,"

    invoke-direct {v2, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v2, "tok":Ljava/util/StringTokenizer;
    const/4 v0, 0x0

    .line 67
    .local v0, "mask":I
    :cond_c
    :goto_c
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_4d

    .line 69
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "s":Ljava/lang/String;
    const-string v3, "threadlocalecimplicitlyca"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 73
    or-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 75
    :cond_21
    const-string v3, "ecimplicitlyca"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 77
    or-int/lit8 v0, v0, 0x2

    goto :goto_c

    .line 79
    :cond_2c
    const-string v3, "threadlocaldhdefaultparams"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 81
    or-int/lit8 v0, v0, 0x4

    goto :goto_c

    .line 83
    :cond_37
    const-string v3, "dhdefaultparams"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_42

    .line 85
    or-int/lit8 v0, v0, 0x8

    goto :goto_c

    .line 87
    :cond_42
    const-string v3, "all"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 89
    or-int/lit8 v0, v0, 0xf

    goto :goto_c

    .line 93
    .end local v1    # "s":Ljava/lang/String;
    :cond_4d
    if-nez v0, :cond_57

    .line 95
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "unknown permissions passed to mask"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 98
    :cond_57
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 127
    if-ne p1, p0, :cond_5

    .line 139
    :cond_4
    :goto_4
    return v1

    .line 132
    :cond_5
    instance-of v3, p1, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;

    if-eqz v3, :cond_22

    move-object v0, p1

    .line 134
    check-cast v0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;

    .line 136
    .local v0, "other":Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;
    iget v3, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    iget v4, v0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    if-ne v3, v4, :cond_20

    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_20
    move v1, v2

    goto :goto_4

    .end local v0    # "other":Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;
    :cond_22
    move v1, v2

    .line 139
    goto :goto_4
.end method

.method public getActions()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->actions:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 144
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    add-int/2addr v0, v1

    return v0
.end method

.method public implies(Ljava/security/Permission;)Z
    .registers 6
    .param p1, "permission"    # Ljava/security/Permission;

    .prologue
    const/4 v1, 0x0

    .line 109
    instance-of v2, p1, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;

    if-nez v2, :cond_6

    .line 121
    :cond_5
    :goto_5
    return v1

    .line 114
    :cond_6
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/security/Permission;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    move-object v0, p1

    .line 119
    check-cast v0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;

    .line 121
    .local v0, "other":Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;
    iget v2, p0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    iget v3, v0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    and-int/2addr v2, v3

    iget v3, v0, Lorg/spongycastle/jcajce/provider/config/ProviderConfigurationPermission;->permissionMask:I

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method
