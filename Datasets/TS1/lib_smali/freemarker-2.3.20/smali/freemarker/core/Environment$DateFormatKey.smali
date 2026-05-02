.class final Lfreemarker/core/Environment$DateFormatKey;
.super Ljava/lang/Object;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/Environment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DateFormatKey"
.end annotation


# instance fields
.field private final dateType:I

.field private final locale:Ljava/util/Locale;

.field private final pattern:Ljava/lang/String;

.field private final timeZone:Ljava/util/TimeZone;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)V
    .registers 5
    .param p1, "dateType"    # I
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 1880
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1881
    iput p1, p0, Lfreemarker/core/Environment$DateFormatKey;->dateType:I

    .line 1882
    iput-object p2, p0, Lfreemarker/core/Environment$DateFormatKey;->pattern:Ljava/lang/String;

    .line 1883
    iput-object p3, p0, Lfreemarker/core/Environment$DateFormatKey;->locale:Ljava/util/Locale;

    .line 1884
    iput-object p4, p0, Lfreemarker/core/Environment$DateFormatKey;->timeZone:Ljava/util/TimeZone;

    .line 1885
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1889
    instance-of v2, p1, Lfreemarker/core/Environment$DateFormatKey;

    if-eqz v2, :cond_2d

    move-object v0, p1

    .line 1891
    check-cast v0, Lfreemarker/core/Environment$DateFormatKey;

    .line 1892
    .local v0, "fk":Lfreemarker/core/Environment$DateFormatKey;
    iget v2, p0, Lfreemarker/core/Environment$DateFormatKey;->dateType:I

    iget v3, v0, Lfreemarker/core/Environment$DateFormatKey;->dateType:I

    if-ne v2, v3, :cond_2d

    iget-object v2, v0, Lfreemarker/core/Environment$DateFormatKey;->pattern:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/core/Environment$DateFormatKey;->pattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, v0, Lfreemarker/core/Environment$DateFormatKey;->locale:Ljava/util/Locale;

    iget-object v3, p0, Lfreemarker/core/Environment$DateFormatKey;->locale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, v0, Lfreemarker/core/Environment$DateFormatKey;->timeZone:Ljava/util/TimeZone;

    iget-object v3, p0, Lfreemarker/core/Environment$DateFormatKey;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    const/4 v1, 0x1

    .line 1894
    .end local v0    # "fk":Lfreemarker/core/Environment$DateFormatKey;
    :cond_2d
    return v1
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1899
    iget v0, p0, Lfreemarker/core/Environment$DateFormatKey;->dateType:I

    iget-object v1, p0, Lfreemarker/core/Environment$DateFormatKey;->pattern:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lfreemarker/core/Environment$DateFormatKey;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lfreemarker/core/Environment$DateFormatKey;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
