.class final Lfreemarker/cache/TemplateCache$TemplateKey;
.super Ljava/lang/Object;
.source "TemplateCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/TemplateCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TemplateKey"
.end annotation


# instance fields
.field private final encoding:Ljava/lang/String;

.field private final locale:Ljava/util/Locale;

.field private final name:Ljava/lang/String;

.field private final parse:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "encoding"    # Ljava/lang/String;
    .param p4, "parse"    # Z

    .prologue
    .line 742
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 743
    iput-object p1, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->name:Ljava/lang/String;

    .line 744
    iput-object p2, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->locale:Ljava/util/Locale;

    .line 745
    iput-object p3, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->encoding:Ljava/lang/String;

    .line 746
    iput-boolean p4, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->parse:Z

    .line 747
    return-void
.end method

.method static access$000(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/TemplateCache$TemplateKey;

    .prologue
    .line 734
    iget-object v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->name:Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/util/Locale;
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/TemplateCache$TemplateKey;

    .prologue
    .line 734
    iget-object v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method static access$200(Lfreemarker/cache/TemplateCache$TemplateKey;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/TemplateCache$TemplateKey;

    .prologue
    .line 734
    iget-object v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method static access$300(Lfreemarker/cache/TemplateCache$TemplateKey;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/TemplateCache$TemplateKey;

    .prologue
    .line 734
    iget-boolean v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->parse:Z

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 751
    instance-of v2, p1, Lfreemarker/cache/TemplateCache$TemplateKey;

    if-eqz v2, :cond_2d

    move-object v0, p1

    .line 753
    check-cast v0, Lfreemarker/cache/TemplateCache$TemplateKey;

    .line 754
    .local v0, "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    iget-boolean v2, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->parse:Z

    iget-boolean v3, v0, Lfreemarker/cache/TemplateCache$TemplateKey;->parse:Z

    if-ne v2, v3, :cond_2d

    iget-object v2, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->name:Ljava/lang/String;

    iget-object v3, v0, Lfreemarker/cache/TemplateCache$TemplateKey;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->locale:Ljava/util/Locale;

    iget-object v3, v0, Lfreemarker/cache/TemplateCache$TemplateKey;->locale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->encoding:Ljava/lang/String;

    iget-object v3, v0, Lfreemarker/cache/TemplateCache$TemplateKey;->encoding:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    const/4 v1, 0x1

    .line 760
    .end local v0    # "tk":Lfreemarker/cache/TemplateCache$TemplateKey;
    :cond_2d
    return v1
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 765
    iget-object v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->encoding:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v1, v0

    iget-boolean v0, p0, Lfreemarker/cache/TemplateCache$TemplateKey;->parse:Z

    if-eqz v0, :cond_20

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_1a
    invoke-virtual {v0}, Ljava/lang/Boolean;->hashCode()I

    move-result v0

    xor-int/2addr v0, v1

    return v0

    :cond_20
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_1a
.end method
