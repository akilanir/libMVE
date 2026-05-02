.class public Lfreemarker/cache/ClassTemplateLoader;
.super Lfreemarker/cache/URLTemplateLoader;
.source "ClassTemplateLoader.java"


# instance fields
.field private loaderClass:Ljava/lang/Class;

.field private path:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 86
    invoke-direct {p0}, Lfreemarker/cache/URLTemplateLoader;-><init>()V

    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "/"

    invoke-direct {p0, v0, v1}, Lfreemarker/cache/ClassTemplateLoader;->setFields(Ljava/lang/Class;Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .param p1, "loaderClass"    # Ljava/lang/Class;

    .prologue
    .line 103
    invoke-direct {p0}, Lfreemarker/cache/URLTemplateLoader;-><init>()V

    .line 104
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lfreemarker/cache/ClassTemplateLoader;->setFields(Ljava/lang/Class;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p1, "loaderClass"    # Ljava/lang/Class;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-direct {p0}, Lfreemarker/cache/URLTemplateLoader;-><init>()V

    .line 137
    invoke-direct {p0, p1, p2}, Lfreemarker/cache/ClassTemplateLoader;->setFields(Ljava/lang/Class;Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method private static isSchemeless(Ljava/lang/String;)Z
    .registers 7
    .param p0, "fullPath"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2f

    const/4 v3, 0x1

    .line 153
    const/4 v1, 0x0

    .line 154
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 157
    .local v2, "ln":I
    if-ge v1, v2, :cond_12

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_12

    add-int/lit8 v1, v1, 0x1

    .line 161
    :cond_12
    :goto_12
    if-ge v1, v2, :cond_1a

    .line 162
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 163
    .local v0, "c":C
    if-ne v0, v5, :cond_1b

    .line 167
    .end local v0    # "c":C
    :cond_1a
    :goto_1a
    return v3

    .line 164
    .restart local v0    # "c":C
    :cond_1b
    const/16 v4, 0x3a

    if-ne v0, v4, :cond_21

    const/4 v3, 0x0

    goto :goto_1a

    .line 165
    :cond_21
    add-int/lit8 v1, v1, 0x1

    .line 166
    goto :goto_12
.end method

.method private setFields(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 5
    .param p1, "loaderClass"    # Ljava/lang/Class;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 171
    if-nez p1, :cond_a

    .line 173
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "loaderClass == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_a
    if-nez p2, :cond_14

    .line 177
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "path == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 179
    :cond_14
    iput-object p1, p0, Lfreemarker/cache/ClassTemplateLoader;->loaderClass:Ljava/lang/Class;

    .line 180
    invoke-static {p2}, Lfreemarker/cache/ClassTemplateLoader;->canonicalizePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/ClassTemplateLoader;->path:Ljava/lang/String;

    .line 181
    return-void
.end method


# virtual methods
.method protected getURL(Ljava/lang/String;)Ljava/net/URL;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 142
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lfreemarker/cache/ClassTemplateLoader;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, "fullPath":Ljava/lang/String;
    iget-object v1, p0, Lfreemarker/cache/ClassTemplateLoader;->path:Ljava/lang/String;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-static {v0}, Lfreemarker/cache/ClassTemplateLoader;->isSchemeless(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_25

    .line 146
    const/4 v1, 0x0

    .line 149
    :goto_24
    return-object v1

    :cond_25
    iget-object v1, p0, Lfreemarker/cache/ClassTemplateLoader;->loaderClass:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    goto :goto_24
.end method
