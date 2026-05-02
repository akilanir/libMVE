.class final Lfreemarker/cache/MultiTemplateLoader$MultiSource;
.super Ljava/lang/Object;
.source "MultiTemplateLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/cache/MultiTemplateLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MultiSource"
.end annotation


# instance fields
.field private final loader:Lfreemarker/cache/TemplateLoader;

.field private final source:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Lfreemarker/cache/TemplateLoader;)V
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "loader"    # Lfreemarker/cache/TemplateLoader;

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iput-object p1, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    .line 169
    iput-object p2, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    .line 170
    return-void
.end method


# virtual methods
.method close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    iget-object v1, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->closeTemplateSource(Ljava/lang/Object;)V

    .line 189
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 192
    instance-of v2, p1, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    if-eqz v2, :cond_1d

    move-object v0, p1

    .line 193
    check-cast v0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    .line 194
    .local v0, "m":Lfreemarker/cache/MultiTemplateLoader$MultiSource;
    iget-object v2, v0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    iget-object v3, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-object v2, v0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    iget-object v3, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v1, 0x1

    .line 196
    .end local v0    # "m":Lfreemarker/cache/MultiTemplateLoader$MultiSource;
    :cond_1d
    return v1
.end method

.method getLastModified()J
    .registers 3

    .prologue
    .line 174
    iget-object v0, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    iget-object v1, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lfreemarker/cache/TemplateLoader;->getLastModified(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method getReader(Ljava/lang/String;)Ljava/io/Reader;
    .registers 4
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    iget-object v1, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-interface {v0, v1, p1}, Lfreemarker/cache/TemplateLoader;->getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 200
    iget-object v0, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->loader:Lfreemarker/cache/TemplateLoader;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->source:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
