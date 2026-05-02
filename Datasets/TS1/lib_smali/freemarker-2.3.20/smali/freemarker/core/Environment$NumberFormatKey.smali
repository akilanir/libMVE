.class final Lfreemarker/core/Environment$NumberFormatKey;
.super Ljava/lang/Object;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Environment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NumberFormatKey"
.end annotation


# instance fields
.field private final locale:Ljava/util/Locale;

.field private final pattern:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 1851
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1852
    iput-object p1, p0, Lfreemarker/core/Environment$NumberFormatKey;->pattern:Ljava/lang/String;

    .line 1853
    iput-object p2, p0, Lfreemarker/core/Environment$NumberFormatKey;->locale:Ljava/util/Locale;

    .line 1854
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1858
    instance-of v2, p1, Lfreemarker/core/Environment$NumberFormatKey;

    if-eqz v2, :cond_1d

    move-object v0, p1

    .line 1860
    check-cast v0, Lfreemarker/core/Environment$NumberFormatKey;

    .line 1861
    .local v0, "fk":Lfreemarker/core/Environment$NumberFormatKey;
    iget-object v2, v0, Lfreemarker/core/Environment$NumberFormatKey;->pattern:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/core/Environment$NumberFormatKey;->pattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-object v2, v0, Lfreemarker/core/Environment$NumberFormatKey;->locale:Ljava/util/Locale;

    iget-object v3, p0, Lfreemarker/core/Environment$NumberFormatKey;->locale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v1, 0x1

    .line 1863
    .end local v0    # "fk":Lfreemarker/core/Environment$NumberFormatKey;
    :cond_1d
    return v1
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1868
    iget-object v0, p0, Lfreemarker/core/Environment$NumberFormatKey;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lfreemarker/core/Environment$NumberFormatKey;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
