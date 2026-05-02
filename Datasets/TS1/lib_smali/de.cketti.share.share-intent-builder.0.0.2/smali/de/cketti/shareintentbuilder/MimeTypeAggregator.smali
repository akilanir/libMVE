.class Lde/cketti/shareintentbuilder/MimeTypeAggregator;
.super Ljava/lang/Object;
.source "MimeTypeAggregator.java"


# static fields
.field private static final ASTERISK_WILDCARD:Ljava/lang/String; = "*"

.field private static final DELIMITER:Ljava/lang/String; = "/"


# instance fields
.field private subType:Ljava/lang/String;

.field private topLevelType:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private alreadyMatchesAllTypes()Z
    .registers 3

    .prologue
    .line 66
    const-string v0, "*"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private checkTypeFormat(Ljava/lang/String;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string v0, "[a-zA-Z0-9+.-]+/[a-zA-Z0-9+.-]+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 61
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Not a valid MIME type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_10
    return-void
.end method

.method private isNotInitialized()Z
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private matchesSubType(Ljava/lang/String;)Z
    .registers 3
    .param p1, "newSubType"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->subType:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private matchesTopLevelType(Ljava/lang/String;)Z
    .registers 3
    .param p1, "newTopLevelType"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v0, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 7
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->checkTypeFormat(Ljava/lang/String;)V

    .line 39
    invoke-direct {p0}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->alreadyMatchesAllTypes()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 56
    :cond_9
    :goto_9
    return-void

    .line 43
    :cond_a
    const-string v3, "/"

    const/4 v4, 0x2

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "parts":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v2, v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "newTopLevelType":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v2, v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "newSubType":Ljava/lang/String;
    invoke-direct {p0}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->isNotInitialized()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 48
    iput-object v1, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    .line 49
    iput-object v0, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->subType:Ljava/lang/String;

    goto :goto_9

    .line 50
    :cond_2e
    invoke-direct {p0, v1}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->matchesTopLevelType(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 51
    const-string v3, "*"

    iput-object v3, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    .line 52
    const-string v3, "*"

    iput-object v3, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->subType:Ljava/lang/String;

    goto :goto_9

    .line 53
    :cond_3d
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->matchesSubType(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 54
    const-string v3, "*"

    iput-object v3, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->subType:Ljava/lang/String;

    goto :goto_9
.end method

.method public getType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 31
    invoke-direct {p0}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->isNotInitialized()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 32
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Add at least one MIME type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->topLevelType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->subType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
