.class Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;
.super Ljava/lang/Object;
.source "StringTemplateLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/StringTemplateLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringTemplateSource"
.end annotation


# instance fields
.field private final lastModified:J

.field private final name:Ljava/lang/String;

.field private final source:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "lastModified"    # J

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    if-nez p1, :cond_d

    .line 151
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "name == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_d
    if-nez p2, :cond_17

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "source == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_17
    const-wide/16 v0, -0x1

    cmp-long v0, p3, v0

    if-gez v0, :cond_25

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "lastModified < -1L"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_25
    iput-object p1, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->name:Ljava/lang/String;

    .line 160
    iput-object p2, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->source:Ljava/lang/String;

    .line 161
    iput-wide p3, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->lastModified:J

    .line 162
    return-void
.end method

.method static access$000(Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;)J
    .registers 3
    .param p0, "x0"    # Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    .prologue
    .line 144
    iget-wide v0, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->lastModified:J

    return-wide v0
.end method

.method static access$100(Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    .prologue
    .line 144
    iget-object v0, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->source:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 165
    instance-of v0, p1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    if-eqz v0, :cond_f

    .line 166
    iget-object v0, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->name:Ljava/lang/String;

    check-cast p1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v1, p1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 168
    :goto_e
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
