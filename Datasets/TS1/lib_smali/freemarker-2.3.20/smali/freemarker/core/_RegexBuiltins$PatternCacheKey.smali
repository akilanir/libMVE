.class Lfreemarker/core/_RegexBuiltins$PatternCacheKey;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PatternCacheKey"
.end annotation


# instance fields
.field private final flags:I

.field private final hashCode:I

.field private final patternString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "patternString"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->patternString:Ljava/lang/String;

    .line 148
    iput p2, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->flags:I

    .line 149
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, p2, 0x1f

    add-int/2addr v0, v1

    iput v0, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->hashCode:I

    .line 150
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "that"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 153
    instance-of v2, p1, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;

    if-eqz v2, :cond_19

    move-object v0, p1

    .line 154
    check-cast v0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;

    .line 155
    .local v0, "thatPCK":Lfreemarker/core/_RegexBuiltins$PatternCacheKey;
    iget v2, v0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->flags:I

    iget v3, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->flags:I

    if-ne v2, v3, :cond_19

    iget-object v2, v0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->patternString:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->patternString:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x1

    .line 158
    .end local v0    # "thatPCK":Lfreemarker/core/_RegexBuiltins$PatternCacheKey;
    :cond_19
    return v1
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 163
    iget v0, p0, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;->hashCode:I

    return v0
.end method
