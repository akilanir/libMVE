.class public Lezvcard/property/ClientPidMap;
.super Lezvcard/property/VCardProperty;
.source "ClientPidMap.java"


# instance fields
.field private pid:Ljava/lang/Integer;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .registers 3
    .param p1, "pid"    # Ljava/lang/Integer;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 103
    iput-object p1, p0, Lezvcard/property/ClientPidMap;->pid:Ljava/lang/Integer;

    .line 104
    iput-object p2, p0, Lezvcard/property/ClientPidMap;->uri:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public static random(Ljava/lang/Integer;)Lezvcard/property/ClientPidMap;
    .registers 5
    .param p0, "pid"    # Ljava/lang/Integer;

    .prologue
    .line 113
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "uuid":Ljava/lang/String;
    new-instance v1, Lezvcard/property/ClientPidMap;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "urn:uuid:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lezvcard/property/ClientPidMap;-><init>(Ljava/lang/Integer;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 7
    .param p2, "version"    # Lezvcard/VCardVersion;
    .param p3, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/ClientPidMap;->pid:Ljava/lang/Integer;

    if-nez v0, :cond_15

    iget-object v0, p0, Lezvcard/property/ClientPidMap;->uri:Ljava/lang/String;

    if-nez v0, :cond_15

    .line 161
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_15
    return-void
.end method

.method public getPid()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lezvcard/property/ClientPidMap;->pid:Ljava/lang/Integer;

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lezvcard/property/ClientPidMap;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public setPid(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pid"    # Ljava/lang/Integer;

    .prologue
    .line 139
    iput-object p1, p0, Lezvcard/property/ClientPidMap;->pid:Ljava/lang/Integer;

    .line 140
    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 155
    iput-object p1, p0, Lezvcard/property/ClientPidMap;->uri:Ljava/lang/String;

    .line 156
    return-void
.end method
