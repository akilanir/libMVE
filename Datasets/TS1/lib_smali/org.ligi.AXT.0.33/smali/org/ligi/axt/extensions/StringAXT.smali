.class public Lorg/ligi/axt/extensions/StringAXT;
.super Ljava/lang/Object;
.source "StringAXT.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 11
    .local p0, "this":Lorg/ligi/axt/extensions/StringAXT;, "Lorg/ligi/axt/extensions/StringAXT<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    .line 13
    return-void
.end method

.method private static parseColorRGBStyle(Ljava/lang/String;I)I
    .registers 6
    .param p0, "color_str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 37
    const-string v2, "rgb *\\( *([0-9]+), *([0-9]+), *([0-9]+) *\\)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 38
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 40
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_41

    .line 41
    const/high16 v2, -0x1000000

    const/4 v3, 0x1

    .line 42
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    const/4 v3, 0x2

    .line 43
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    const/4 v3, 0x3

    .line 44
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    or-int p1, v2, v3

    .line 48
    .end local p1    # "defaultValue":I
    :cond_41
    return p1
.end method


# virtual methods
.method public parseColor(I)I
    .registers 4
    .param p1, "defaultValue"    # I

    .prologue
    .line 16
    .local p0, "this":Lorg/ligi/axt/extensions/StringAXT;, "Lorg/ligi/axt/extensions/StringAXT<TT;>;"
    iget-object v0, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    if-nez v0, :cond_5

    .line 32
    .end local p1    # "defaultValue":I
    :cond_4
    :goto_4
    return p1

    .line 20
    .restart local p1    # "defaultValue":I
    :cond_5
    iget-object v0, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    const-string v1, "rgb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 21
    iget-object v0, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/ligi/axt/extensions/StringAXT;->parseColorRGBStyle(Ljava/lang/String;I)I

    move-result p1

    goto :goto_4

    .line 24
    :cond_16
    iget-object v0, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 26
    :try_start_20
    iget-object v0, p0, Lorg/ligi/axt/extensions/StringAXT;->string:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_25} :catch_27

    move-result p1

    goto :goto_4

    .line 27
    :catch_27
    move-exception v0

    goto :goto_4
.end method
