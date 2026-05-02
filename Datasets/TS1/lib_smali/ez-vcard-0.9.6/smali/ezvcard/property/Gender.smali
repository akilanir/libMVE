.class public Lezvcard/property/Gender;
.super Lezvcard/property/VCardProperty;
.source "Gender.java"


# static fields
.field public static final FEMALE:Ljava/lang/String; = "F"

.field public static final MALE:Ljava/lang/String; = "M"

.field public static final NONE:Ljava/lang/String; = "N"

.field public static final OTHER:Ljava/lang/String; = "O"

.field public static final UNKNOWN:Ljava/lang/String; = "U"


# instance fields
.field private gender:Ljava/lang/String;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "gender"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 95
    iput-object p1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public static female()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 190
    new-instance v0, Lezvcard/property/Gender;

    const-string v1, "F"

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static male()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 182
    new-instance v0, Lezvcard/property/Gender;

    const-string v1, "M"

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static none()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 207
    new-instance v0, Lezvcard/property/Gender;

    const-string v1, "N"

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static other()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 198
    new-instance v0, Lezvcard/property/Gender;

    const-string v1, "O"

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static unknown()Lezvcard/property/Gender;
    .registers 2

    .prologue
    .line 215
    new-instance v0, Lezvcard/property/Gender;

    const-string v1, "U"

    invoke-direct {v0, v1}, Lezvcard/property/Gender;-><init>(Ljava/lang/String;)V

    return-object v0
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
    .line 100
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
    .line 220
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    iget-object v0, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    if-nez v0, :cond_11

    .line 221
    new-instance v0, Lezvcard/Warning;

    const/16 v1, 0x8

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    :cond_11
    return-void
.end method

.method public getGender()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lezvcard/property/Gender;->text:Ljava/lang/String;

    return-object v0
.end method

.method public isFemale()Z
    .registers 3

    .prologue
    .line 149
    const-string v0, "F"

    iget-object v1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isMale()Z
    .registers 3

    .prologue
    .line 141
    const-string v0, "M"

    iget-object v1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isNone()Z
    .registers 3

    .prologue
    .line 166
    const-string v0, "N"

    iget-object v1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isOther()Z
    .registers 3

    .prologue
    .line 157
    const-string v0, "O"

    iget-object v1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isUnknown()Z
    .registers 3

    .prologue
    .line 174
    const-string v0, "U"

    iget-object v1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setGender(Ljava/lang/String;)V
    .registers 2
    .param p1, "gender"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lezvcard/property/Gender;->gender:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lezvcard/property/Gender;->text:Ljava/lang/String;

    .line 117
    return-void
.end method
